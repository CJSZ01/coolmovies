import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  const BaseView({
    required this.child,
    this.appBar,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: child,
      ),
    );
  }
}
