import 'package:flutter/material.dart';
import 'package:task_6/presentation/screens.dart/loginpage.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 208,
            width: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF3C4955),
              ),
              child: Image.asset(
                'assets/pics/Mask Group.png',
              ),
            ),
          ),
          ListTile(
            title: Text('Your profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Login/Logout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
