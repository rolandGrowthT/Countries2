import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/presentation/screens.dart/home_page_screen.dart';
import 'package:task_6/provider/Language_provider.dart';
import 'package:task_6/provider/Property_provider.dart';
import 'package:task_6/provider/cityV0_provider.dart';
import 'package:task_6/provider/loading.dart';
import 'provider/Country_provider.dart';
import 'provider/State_provider.dart';
import 'package:task_6/presentation/screens.dart/UIpage.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Country_provider()),
      ChangeNotifierProvider(create: (context) => State_provider()),
      ChangeNotifierProvider(create: (context) => CityVO_Provider()),
      ChangeNotifierProvider(create: (context) => Language_Provider()),
      ChangeNotifierProvider(create: (context) => loading()),
      ChangeNotifierProvider(create: (context) => Property_provider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
