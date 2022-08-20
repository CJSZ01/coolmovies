import 'package:coolmovies/core/models/review.dart';
import 'package:coolmovies/view/pages/movie_details/components/movie_review_content.dart';
import 'package:coolmovies/view/pages/movie_details/components/movie_review_header.dart';
import 'package:coolmovies/view/pages/movie_details/components/user_avatar.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieReviewsList extends StatelessWidget {
  const MovieReviewsList({
    required this.reviews,
    Key? key,
  }) : super(key: key);

  final List<Review> reviews;

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
                      MovieReviewContent(review: currentReview)
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
