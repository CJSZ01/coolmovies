import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  const BaseView({
    required this.child,
    required this.showFAB,
    this.drawer,
    this.appBar,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.onPressFAB,
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
        showFAB = false,
        onPressFAB = null,
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
        showFAB = false,
        onPressFAB = null,
        super(key: key);

  final Widget child;
  final Widget? drawer;
  final PreferredSizeWidget? appBar;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;

  final String? errorMessage;
  final bool showFAB;
  final VoidCallback? onPressFAB;

  @override
  Widget build(BuildContext context) {
    if (showFAB == true) {
      assert(
        onPressFAB != null,
        'When enabling the Floating Action Button (FAB), the parameter onPressFAB must be supplied.',
      );
    }
    return Scaffold(
      floatingActionButton: showFAB
          ? FloatingActionButton(
              child: const Icon(Icons.arrow_back),
              onPressed: onPressFAB,
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: bottomNavigationBar,
      appBar: appBar,
      body: SafeArea(
        child: child,
      ),
      bottomSheet: bottomSheet,
    );
  }
}
