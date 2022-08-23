import 'dart:io';

import 'package:coolmovies/utils/app_routes.dart';
import 'package:coolmovies/utils/themes/default_theme.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    Platform.isAndroid
        ? 'http://10.0.2.2:5001/graphql'
        : 'http://localhost:5001/graphql',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  final Link link = authLink.concat(httpLink);

  final ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      defaultPolicies:
          DefaultPolicies(query: Policies(fetch: FetchPolicy.networkOnly)),
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  runApp(
    GraphQLProvider(
      client: client,
      child: const CoolMoviesApp(),
    ),
  );
}

class CoolMoviesApp extends StatelessWidget {
  const CoolMoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoolMovies',
      theme: DefaultTheme.themeData,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}
