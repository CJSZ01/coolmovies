import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  const BaseView({
    required this.child,
    this.drawer,
    this.appBar,
    this.bottomSheet,
    this.bottomNavigationBar,
    Key? key,
  })  : errorMessage = null,
        super(key: key);

  BaseView.error({
    required this.errorMessage,
    Key? key,
  })  : child = Center(child: Text(errorMessage!)),
        drawer = null,
        appBar = null,
        bottomNavigationBar = null,
        bottomSheet = null,
        super(key: key);

  const BaseView.loading({
    Key? key,
  })  : child = const Center(
          child: CircularProgressIndicator(),
        ),
        errorMessage = null,
        drawer = null,
        appBar = null,
        bottomNavigationBar = null,
        bottomSheet = null,
        super(key: key);

  final Widget child;
  final Widget? drawer;
  final PreferredSizeWidget? appBar;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;

  final String? errorMessage;

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
