import 'package:coolmovies/core/models/movie.dart';
import 'package:coolmovies/core/models/review.dart';
import 'package:coolmovies/core/repositories/interfaces/review_repository_interface.dart';
import 'package:coolmovies/view/components/review_dialog/review_dialog.dart';
import 'package:coolmovies/view/pages/movie_details/components/movie_review_content.dart';
import 'package:coolmovies/view/pages/movie_details/components/movie_review_header.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class MovieReviewsList extends StatelessWidget {
  const MovieReviewsList({
    required this.reviews,
    required this.movie,
    required this.onReviewEdited,
    required this.onReviewDeleted,
    required final IReviewRepository reviewRepository,
    Key? key,
  })  : _reviewRepository = reviewRepository,
        super(key: key);

  final List<Review> reviews;
  final Movie movie;
  final Function(int index, Review newReview) onReviewEdited;
  final Function(int index, Review deletedReview) onReviewDeleted;
  final IReviewRepository _reviewRepository;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: reviews.length,
      padding: const EdgeInsets.all(2.0),
      itemBuilder: (context, index) {
        final ExpandableController expandableController =
            ExpandableController();
        final currentReview = reviews[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => expandableController.expanded =
                    !expandableController.expanded,
                child: ExpandablePanel(
                  controller: expandableController,
                  expanded: Column(
                    children: [
                      MovieReviewHeader(review: currentReview),
                      MovieReviewContent(
                        review: currentReview,
                        onPressEdit: () {
                          showDialog(
                            context: context,
                            builder: (context) => ReviewDialog.edit(
                              movie: movie,
                              onReviewEdited: (review) {
                                onReviewEdited(
                                  reviews.indexOf(currentReview),
                                  review,
                                );
                              },
                              review: currentReview,
                              reviewRepository: _reviewRepository,
                            ),
                          );
                        },
                        onPressDelete: () {
                          onReviewDeleted(
                            reviews.indexOf(currentReview),
                            currentReview,
                          );
                        },
                      )
                    ],
                  ),
                  collapsed: MovieReviewHeader(review: currentReview),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
