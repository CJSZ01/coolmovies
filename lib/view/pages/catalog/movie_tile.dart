import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    required this.title,
    required this.imgUrl,
    required this.onTap,
    required this.rating,
    Key? key,
  }) : super(key: key);

  final String title;
  final String imgUrl;
  final double rating;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final imageFrameNotifier = ValueNotifier<int?>(null);
    return InkWell(
      onTap: () => onTap(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Image.network(
              imgUrl,
              height: 300,
              width: 200,
              fit: BoxFit.fill,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => imageFrameNotifier.value = frame,
                );
                if (wasSynchronouslyLoaded) {
                  return child;
                }

                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  // transform: GradientTransform(),
                  colors: [
                    Theme.of(context).colorScheme.shadow,
                    Colors.transparent,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ValueListenableBuilder<int?>(
                  valueListenable: imageFrameNotifier,
                  builder: (context, frame, child) {
                    return AnimatedOpacity(
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(seconds: 1),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Theme.of(context).colorScheme.background,
                            ),
                        maxLines: 2,
                      ),
                    );
                  },
                ),
              ),
            ),
            ValueListenableBuilder<int?>(
              valueListenable: imageFrameNotifier,
              builder: (context, frame, child) {
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(spreadRadius: 1, blurRadius: 4)
                        ],
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Theme.of(context).colorScheme.background,
                            ),
                            Text(
                              rating.toStringAsFixed(2),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                      ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
