import 'package:coolmovies/core/models/review.dart';
import 'package:coolmovies/view/pages/movie_details/components/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieReviewHeader extends StatelessWidget {
  const MovieReviewHeader({
    required this.review,
    Key? key,
  }) : super(key: key);

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        UserAvatar(user: review.user!),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Wrap(
            children: [
              Text(
                review.title,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              )
            ],
          ),
        ),
        RatingBar.builder(
          itemSize: 20,
          initialRating: review.rating.toDouble(),
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: Theme.of(context).colorScheme.primary,
          ),
          ignoreGestures: true,
          onRatingUpdate: (rating) {},
        ),
      ],
    );
  }
}
