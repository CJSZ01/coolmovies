import 'package:coolmovies/core/models/user.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      child: Text(user.name[0]),
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.9),
    );
  }
}
