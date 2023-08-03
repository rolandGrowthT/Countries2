import 'package:flutter/material.dart';
import 'package:task_6/presentation/screens.dart/home_page_screen.dart';

class SignUpPage extends StatelessWidget {
  @override
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
                onPressed: () {
                  print('Sign Up button pressed');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF297BE6),
                  padding: EdgeInsets.symmetric(
                      horizontal: 0, vertical: 16),

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
