import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/routing/route_path.dart';
import 'package:myapp/second_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RoutePath.homePage:
      return MaterialPageRoute(
        builder: (_) => const MyHomePage(),
      );

    case RoutePath.secondScreen:
      return MaterialPageRoute(
        builder: (_) => const SecondScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Page not found!'),
          ),
        ),
      );
  }
}
