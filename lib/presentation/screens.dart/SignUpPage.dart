import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:task_6/presentation/screens.dart/home_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_6/presentation/screens.dart/loginpage.dart';
import 'package:task_6/Services.dart/Firebase_Services.dart';
import 'package:task_6/presentation/shared%20widgets/CustomSnackbar_Widget.dart';
import 'package:task_6/presentation/shared%20widgets/Loading_Widget.dart';
import 'package:task_6/provider/CurrentUser_provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  final controller1 = TextEditingController();

  final controller2 = TextEditingController();

  final controller3 = TextEditingController();

  final controller4 = TextEditingController();
  String temp = '';
  int Except = 0;
  bool isobscured = true;
  String imageused = 'assets/icons/Group 11783.svg';
  Widget build(BuildContext context) {
    return Consumer<CurrentUserProvider>(
        builder: (context, currentUserProvider, _) {
      return Scaffold(
        appBar: AppBar(
          title: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(175, 0, 0, 20),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          fontFamily: 'MontserratMedium', fontSize: 16),
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
                          Stack(
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
                                  obscureText: isobscured,
                                  controller: controller2,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'MontserratMedium'),
                                  decoration: InputDecoration(
                                    hintText: '**********',
                                    hintStyle:
                                        TextStyle(color: Color(0xFFB2BBCA)),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(300, 5, 0, 5),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isobscured = !isobscured;
                                });
                              },
                              icon: isobscured
                                  ? SvgPicture.asset(
                                      'assets/icons/Group 13829.svg',
                                      width: 18,
                                      height: 18,
                                    )
                                  : SvgPicture.asset(
                                      'assets/icons/Group 11783.svg',
                                      width: 18,
                                      height: 18,
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
                        print('SignUp button pressed');
                        String temp = await currentUserProvider.signUp(
                            context,
                            controller1.text,
                            controller2.text,
                            controller3.text,
                            controller4.text);
                        if (temp != '') CustomSnackbar.show(context, '$temp');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF297BE6),
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 16),
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
              currentUserProvider.isLoading
                  ? LoadingWidget()
                  : SizedBox.shrink(),
            ],
          ),
        ),
      );
    });
  }
}
