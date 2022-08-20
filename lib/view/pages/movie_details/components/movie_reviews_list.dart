import 'package:coolmovies/core/models/review.dart';
import 'package:flutter/material.dart';

class MovieReviewsList extends StatelessWidget {
  const MovieReviewsList({
    required this.reviews,
    Key? key,
  }) : super(key: key);

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final currentReview = reviews[index];
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                Text(
                  currentReview.title,
                  textAlign: TextAlign.start,
                )
              ] +
              List<Widget>.generate(
                currentReview.rating,
                (index) => Icon(
                  Icons.star,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ).toList(),
        );
      },
    );
  }
}
