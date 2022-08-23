import 'package:coolmovies/core/models/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MovieReviewContent extends StatelessWidget {
  const MovieReviewContent({
    required this.review,
    required this.onPressEdit,
    required this.onPressDelete,
    Key? key,
  }) : super(key: key);

  final Review review;
  final VoidCallback onPressEdit;
  final VoidCallback onPressDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              review.user!.name,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Text(review.rating.toDouble().toString())
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: [
              Text(
                review.body,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        //TODO: Implement current user
        if (review.user!.id == '65549e6a-2389-42c5-909a-4475fdbb3e69')
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: onPressEdit,
                child: Text(
                  AppLocalizations.of(context)!.reviewDialogEditButton,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: onPressDelete,
                child: Text(AppLocalizations.of(context)!.reviewDialogDelete),
              )
            ],
          )
      ],
    );
  }
}
