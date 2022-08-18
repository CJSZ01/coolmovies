import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    required this.title,
    required this.imgUrl,
    Key? key,
  }) : super(key: key);

  final String title;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    final didLoadImage = ValueNotifier<bool>(false);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary),
          ),
          child: Image.network(
            imgUrl,
            height: 190,
            width: 150,
            fit: BoxFit.fill,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) {
                return child;
              }
              if (frame != null) {
                WidgetsBinding.instance
                    .addPostFrameCallback((_) => didLoadImage.value = true);
              }
              return AnimatedOpacity(
                opacity: frame == null ? 0 : 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
                child: child,
              );
            },
          ),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: didLoadImage,
          builder: (context, didLoadImage, child) {
            return AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: didLoadImage
                    ? Text(
                        title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.caption,
                        maxLines: 2,
                      )
                    : const SizedBox.shrink());
          },
        ),
      ],
    );
  }
}
