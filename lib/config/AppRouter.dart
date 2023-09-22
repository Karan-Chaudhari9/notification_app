
import 'package:flutter/material.dart';
import 'package:notification_app/screens/auth_screen.dart';
import 'package:notification_app/screens/login_screen.dart';
import 'package:notification_app/screens/signup_screen.dart';

import '../screens/home_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      case LogInScreen.routeName:
        return LogInScreen.route();
      case RegisterScreenView.routeName:
        return RegisterScreenView.route();
      case AuthScreen.routeName:
        return AuthScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder: (_) => Scaffold(appBar: AppBar(title: Text('Error'),))
    );
  }
}
