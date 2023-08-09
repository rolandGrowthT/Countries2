import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/models/CurrentUser_model.dart';
import 'package:task_6/presentation/screens.dart/LoadingScreen.dart';
import 'package:task_6/presentation/screens.dart/home_page_screen.dart';
import 'package:task_6/presentation/screens.dart/loginpage.dart';
import 'package:task_6/provider/CurrentUser_provider.dart';
import 'package:task_6/provider/Language_provider.dart';
import 'package:task_6/provider/Property_provider.dart';
import 'package:task_6/provider/cityV0_provider.dart';
import 'provider/Country_provider.dart';
import 'provider/State_provider.dart';
import 'package:task_6/presentation/screens.dart/UIpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CountryProvider()),
      ChangeNotifierProvider(create: (context) => StateProvider()),
      ChangeNotifierProvider(create: (context) => CityVOProvider()),
      ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ChangeNotifierProvider(create: (context) => CurrentUserProvider()),
      ChangeNotifierProvider(create: (context) => PropertyProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: loadingscreen(),
    );
  }
}
