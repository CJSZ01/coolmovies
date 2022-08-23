import 'package:coolmovies/core/models/movie.dart';
import 'package:coolmovies/core/models/review.dart';
import 'package:coolmovies/core/repositories/interfaces/review_repository_interface.dart';
import 'package:coolmovies/core/view_state_enum.dart';
import 'package:coolmovies/view/components/review_dialog/review_dialog_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReviewDialog extends StatelessWidget {
  final Movie movie;
  final Function(Review)? onReviewCreated;
  final Review? review;
  final Function(Review)? onReviewEdited;
  final IReviewRepository _repository;

  const ReviewDialog({
    required this.movie,
    required this.onReviewCreated,
    required final IReviewRepository reviewRepository,
    Key? key,
  })  : onReviewEdited = null,
        review = null,
        _repository = reviewRepository,
        super(key: key);

  const ReviewDialog.edit({
    required this.movie,
    required this.onReviewEdited,
    required this.review,
    required final IReviewRepository reviewRepository,
    Key? key,
  })  : onReviewCreated = null,
        _repository = reviewRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isEditing = review != null;

    return ViewModelBuilder<ReviewDialogViewModel>.reactive(
      viewModelBuilder: () => ReviewDialogViewModel(
        movie: movie,
        reviewRepository: _repository,
        editingReview: review,
      ),
      onModelReady: (viewModel) => viewModel.onModelReady(),
      builder: (context, viewModel, child) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 5,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).colorScheme.background,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        '${isEditing ? AppLocalizations.of(context)!.reviewEditingDialogTitle : AppLocalizations.of(context)!.reviewDialogTitle} ${movie.title}',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    TextFormField(
                      controller: viewModel.reviewTitleController,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!
                            .reviewDialogTitleInputLabel,
                      ),
                      maxLength: 64,
                    ),
                    TextFormField(
                      controller: viewModel.reviewBodyController,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!
                            .reviewDialogContentInputLabel,
                      ),
                      maxLines: 8,
                      maxLength: 256,
                    ),
                    Text(
                      AppLocalizations.of(context)!.reviewDialogRatingLabel,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Theme.of(context).hintColor),
                    ),
                    RatingBar.builder(
                      itemSize: 32,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      initialRating: viewModel.reviewRating,
                      onRatingUpdate: (rating) =>
                          viewModel.reviewRating = rating,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: viewModel.viewState == ViewState.SUCCESS
                            ? ElevatedButton(
                                onPressed: () async {
                                  if (isEditing) {
                                    final response =
                                        await viewModel.updateReview();
                                    response.fold((l) => null, (r) {
                                      onReviewEdited!(r);
                                      Navigator.pop(context);
                                    });
                                  } else {
                                    final response =
                                        await viewModel.createReview();
                                    response.fold((l) => null, (r) {
                                      onReviewCreated!(r);
                                      Navigator.pop(context);
                                    });
                                  }
                                },
                                child: Text(AppLocalizations.of(context)!
                                    .reviewDialogSaveButton),
                              )
                            : const CircularProgressIndicator(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
