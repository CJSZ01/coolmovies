import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  const BaseView({
    required this.child,
    this.drawer,
    this.appBar,
    this.bottomSheet,
    this.bottomNavigationBar,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Widget? drawer;
  final PreferredSizeWidget? appBar;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      appBar: appBar,
      body: SafeArea(
        child: child,
      ),
      bottomSheet: bottomSheet,
    );
  }
}
