import 'package:coolmovies/core/models/review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MovieReviewsList extends StatelessWidget {
  const MovieReviewsList({Key? key, required this.reviews}) : super(key: key);

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
