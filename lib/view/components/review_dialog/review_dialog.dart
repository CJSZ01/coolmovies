import 'package:coolmovies/core/models/movie.dart';
import 'package:coolmovies/core/view_state_enum.dart';
import 'package:coolmovies/view/components/review_dialog/review_dialog_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';

class ReviewDialog extends StatelessWidget {
  const ReviewDialog({
    required this.movie,
    Key? key,
  }) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReviewDialogViewModel>.reactive(
        viewModelBuilder: () => ReviewDialogViewModel(movie),
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
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Resenha - ${movie.title}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      TextFormField(
                        controller: viewModel.reviewTitleController,
                        decoration: const InputDecoration(
                          hintText: 'Título',
                        ),
                        maxLength: 64,
                      ),
                      TextFormField(
                        controller: viewModel.reviewBodyController,
                        decoration: const InputDecoration(
                          hintText: 'Conteúdo',
                        ),
                        maxLines: 8,
                        maxLength: 256,
                      ),
                      Text(
                        'Avaliação',
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
                                  onPressed: () {},
                                  child: const Text('Salvar'),
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
        });
  }
}
