import 'package:coolmovies/view/components/base_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Center(
        child: Column(
          children: [
            Text(
              'CoolMovies',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Sign Up'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
