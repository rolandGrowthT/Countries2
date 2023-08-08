import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/presentation/screens.dart/home_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_6/presentation/screens.dart/loginpage.dart';
import 'package:task_6/Services.dart/FirebaseServices.dart';
import 'package:task_6/presentation/shared%20widgets/customsnackbar.dart';
import 'package:task_6/provider/CurrentUser_provider.dart';

class SignUpPage extends StatelessWidget {
  @override
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  int Except = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(175, 0, 0, 20),
              child: Text(
                'Sign up',
                style: TextStyle(fontFamily: 'MontserratMedium', fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'MontserratRegular',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 2, 0, 0),
                      child: TextField(
                        controller: controller1,
                        style: TextStyle(
                            fontSize: 14, fontFamily: 'MontserratMedium'),
                        decoration: InputDecoration(
                          hintText: 'JohnDoe@otonomus.com',
                          hintStyle: TextStyle(color: Color(0xFFB2BBCA)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'MontserratRegular',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 2, 0, 0),
                      child: TextField(
                        obscureText: true,
                        controller: controller2,
                        style: TextStyle(
                            fontSize: 14, fontFamily: 'MontserratMedium'),
                        decoration: InputDecoration(
                          hintText: '**********',
                          hintStyle: TextStyle(color: Color(0xFFB2BBCA)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                      child: Text(
                        'First Name',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'MontserratRegular',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 2, 0, 0),
                      child: TextField(
                        controller: controller3,
                        style: TextStyle(
                            fontSize: 14, fontFamily: 'MontserratMedium'),
                        decoration: InputDecoration(
                          hintText: 'John',
                          hintStyle: TextStyle(color: Color(0xFFB2BBCA)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                      child: Text(
                        'Last Name',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'MontserratRegular',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 2, 0, 0),
                      child: TextField(
                        controller: controller4,
                        style: TextStyle(
                            fontSize: 14, fontFamily: 'MontserratMedium'),
                        decoration: InputDecoration(
                          hintText: 'Doe',
                          hintStyle: TextStyle(color: Color(0xFFB2BBCA)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(26, 300, 26, 70),
              child: ElevatedButton(
                onPressed: () async {
                  if (controller3.text.trim() == '' &&
                      controller4.text.trim() == '') {
                    Except = 1;
                    CustomSnackbar.show(context,
                        'Please provide a valid first name and last name');
                  } else if (controller3.text.trim() == '' &&
                      controller4.text.trim() != '') {
                    Except = 1;
                    CustomSnackbar.show(
                        context, 'Please provide a valid first name ');
                  } else if (controller3.text.trim() != '' &&
                      controller4.text.trim() == '') {
                    Except = 1;
                    CustomSnackbar.show(
                        context, 'Please provide a valid last name');
                  } else {
                    Except = 0;
                  }

                  if (Except == 0) {
                    try {
                      print('Sign Up button pressed');
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: controller1.text.trim(),
                              password: controller2.text.trim());

                      User? user = FirebaseAuth.instance.currentUser;
                      if (user != null) {
                        insertuser(user.uid, controller3.text.trim(),
                            controller4.text.trim());
                        Provider.of<CurrentUser_provider>(context,
                                listen: false)
                            .fetchCurrentuser(user.uid);
                      }

                      Navigator.popUntil(context, (route) => route.isFirst);
                    } catch (e) {
                      print('firebase error');
                      if (e is FirebaseAuthException &&
                          controller1.text.trim() != '' &&
                          controller2.text.trim() != '') {
                        CustomSnackbar.show(context, '${e.message}');
                      } else {
                        if (controller1.text.trim() == '' &&
                            controller2.text.trim() == '')
                          CustomSnackbar.show(
                              context, 'Please enter an email and password');
                        else if (controller1.text.trim() != '' &&
                            controller2.text.trim() == '')
                          CustomSnackbar.show(
                              context, 'Please enter a password');
                        else
                          CustomSnackbar.show(context, 'Please enter an email');
                      }
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF297BE6),
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontFamily: 'MontserratMedium',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
