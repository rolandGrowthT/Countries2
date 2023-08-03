import 'package:flutter/material.dart';
import 'package:task_6/presentation/screens.dart/SignUpPage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 28, 0, 30),
              child: Image.asset(
                'assets/pics/Group 10961.png',
                height: 48,
                width: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 10, 0, 12),
              child: Text(
                'You need to login to complete the booking process',
                style: TextStyle(fontSize: 12, fontFamily: 'MontserratRegular'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 34, 30, 24),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0),
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
                        style: TextStyle(
                            fontSize: 14, fontFamily: 'MontserratRegular'),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 2, 30, 0),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(255, 0, 0, 50),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    fontFamily: 'MontserratRegular',
                    color: Colors.blue,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: ElevatedButton(
                onPressed: () {
                  print('Login button pressed');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF297BE6),
                  padding: EdgeInsets.symmetric(
                      horizontal: 0, vertical: 16), // Button padding

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'LOG IN',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontFamily: 'MontserratMedium',
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(82, 275, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                        fontFamily: 'MontserratSemiBold', fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.none,
                        fontFamily: 'MontserratSemiBold',
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
