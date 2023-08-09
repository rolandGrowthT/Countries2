import 'package:flutter/material.dart';
import 'package:task_6/presentation/screens.dart/LoadingScreen.dart';
import 'package:task_6/presentation/screens.dart/LoginPage.dart';
import 'package:task_6/presentation/screens.dart/Results.dart';
import 'package:task_6/presentation/screens.dart/SignUpPage.dart';
import 'package:task_6/presentation/screens.dart/UIpage.dart';
import 'package:task_6/presentation/screens.dart/home_page_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/HomePageScreen':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/LoadingScreen':
        return MaterialPageRoute(builder: (_) => loadingscreen());
      case '/LoginPage':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/Results':
        return MaterialPageRoute(builder: (_) => Results());
      case '/SignUpPage':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/UIpage':
        return MaterialPageRoute(builder: (_) => UIpage());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
