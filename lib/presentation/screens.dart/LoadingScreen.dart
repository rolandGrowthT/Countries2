import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/presentation/screens.dart/home_page_screen.dart';
import 'package:task_6/presentation/screens.dart/loginpage.dart';
import 'package:task_6/provider/CurrentUser_provider.dart';
import 'package:task_6/provider/Property_provider.dart';

class loadingscreen extends StatefulWidget {
  const loadingscreen({super.key});

  @override
  State<loadingscreen> createState() => _loadingscreenState();
}

class _loadingscreenState extends State<loadingscreen> {
  @override
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void initState() {
    Provider.of<PropertyProvider>(context, listen: false).fetchproperties();
    super.initState();
    checkAuthentication();
  }

  void checkAuthentication() async {
    await Future.delayed(Duration(seconds: 2));
    final user = _auth.currentUser;
    if (user != null) {
      Provider.of<CurrentUserProvider>(context, listen: false)
          .fetchCurrentuser(user.uid);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/pics/Group 10961.png',
        ),
      ),
    );
  }
}
