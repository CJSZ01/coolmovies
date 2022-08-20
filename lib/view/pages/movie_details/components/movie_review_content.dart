import 'package:coolmovies/core/models/review.dart';
import 'package:flutter/material.dart';

class MovieReviewContent extends StatelessWidget {
  const MovieReviewContent({
    required this.review,
    Key? key,
  }) : super(key: key);

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [Text(review.user!.name)],
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
        if (review.user!.name == 'Ayla')
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Editar'),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Excluir'),
              )
            ],
          )
      ],
    );
  }
}
