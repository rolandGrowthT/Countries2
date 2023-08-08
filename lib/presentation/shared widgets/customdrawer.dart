import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/models/CurrentUser.dart';
import 'package:task_6/presentation/screens.dart/home_page_screen.dart';
import 'package:task_6/presentation/screens.dart/loginpage.dart';
import 'package:task_6/provider/CurrentUser_provider.dart';

class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  String logging = 'Login';
  void initState() {
    final user = _auth.currentUser;
    if (user != null) {
      Provider.of<CurrentUser_provider>(context, listen: false)
          .fetchCurrentuser(user.uid);
      logging = 'Logout';
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    CurrentUser Cuser = Provider.of<CurrentUser_provider>(context).Cuser;

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
          if (logging != 'Login')
            ListTile(
              title: Text(
                'Welcome ${Cuser.firstName}',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ListTile(
            title: Text('Your profile'),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('$logging'),
            onTap: () async {
              try {
                if (logging == 'Logout') {
                  await FirebaseAuth.instance.signOut();
                  Scaffold.of(context).openEndDrawer();
                  Navigator.popUntil(context, (route) => route.isFirst);
                } else {
                  Scaffold.of(context).openEndDrawer();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                }
              } catch (e) {
                print('Error logging out');
              }
            },
          ),
        ],
      ),
    );
  }
}
