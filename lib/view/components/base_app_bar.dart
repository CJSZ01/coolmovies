import 'package:flutter/material.dart';

class BaseAppBar extends AppBar {
  BaseAppBar({
    required String title,
    Key? key,
  }) : super(
          key: key,
          title: Center(
            child: Text(
              title,
            ),
          ),
          automaticallyImplyLeading: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        );
}
