import 'package:flutter/material.dart';
import 'package:learning_routes/home_screen.dart';
import 'package:learning_routes/screen_three.dart';
import 'package:learning_routes/screen_two.dart';
import 'package:learning_routes/utils/route_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteName.screenTwo:
        return MaterialPageRoute(
          builder: (context) => ScreenTwo(arguments: settings.arguments),
        );
      case RouteName.screenThree:
        return MaterialPageRoute(builder: (context) => ScreenThree());
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(body: Text("Entered wrong route"));
          },
        );
    }
  }
}
