import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    required this.title,
    required this.imgUrl,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final String imgUrl;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final didLoadImage = ValueNotifier<bool>(false);
    return InkWell(
      onTap: () => onTap(),
      child: Column(
        children: [
          Image.network(
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
                    : const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
    );
  }
}