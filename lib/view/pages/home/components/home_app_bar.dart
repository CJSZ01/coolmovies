import 'package:flutter/material.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({
    required String title,
    Key? key,
  }) : super(
          key: key,
          title: Center(
            child: Text(
              title,
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        );
}
