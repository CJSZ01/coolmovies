import 'package:coolmovies/utils/app_locale_notifier.dart';
import 'package:coolmovies/view/components/base_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocaleNotifier localeNotifier = Provider.of<AppLocaleNotifier>(context);
    return BaseView(
        child: Column(children: [
          ElevatedButton(
              onPressed: () {
                localeNotifier.toggleLocale();
              },
              child: Text('Change language'))
        ]),
        showFAB: false);
  }
}
