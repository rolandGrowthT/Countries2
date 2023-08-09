import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_6/Services.dart/Firebase_Services.dart';
import 'package:task_6/models/CurrentUser_model.dart';
import 'package:task_6/presentation/shared%20widgets/CustomSnackbar_widget.dart';
import 'package:task_6/presentation/shared%20widgets/Loading_Widget.dart';

class CurrentUserProvider extends ChangeNotifier {
  CurrentUserModel _Cuser =
      new CurrentUserModel(id: '', firstName: '', lastName: '');
  CurrentUserModel get Cuser => _Cuser;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> Turnloading() async {
    _isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetchCurrentuser(String id) async {
    _Cuser = (await getUserById(id))!;
    notifyListeners();
  }

  static Future<CurrentUserModel?> getUserById(String userId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await FirebaseFirestore.instance
              .collection('users_collection')
              .doc(userId)
              .get();
      if (userSnapshot.exists) {
        final userData = userSnapshot.data();
        return CurrentUserModel(
          id: userId,
          firstName: userData?['firstName'] ?? '',
          lastName: userData?['lastName'] ?? '',
        );
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
    return null;
  }

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    Turnloading();

    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      final user = _auth.currentUser;
      if (user != null) {
        fetchCurrentuser(user.uid);
      }
      Navigator.popUntil(context, (route) => route.isFirst);
    } catch (e) {
      print('Invalid password');
      if (e is FirebaseAuthException &&
          email.trim() != '' &&
          password.trim() != '') {
        CustomSnackbar.show(context, '${e.message}');
      } else {
        if (email.trim() == '' && password.trim() == '') {
          CustomSnackbar.show(context, 'Please enter an email and password');
        } else if (email.trim() != '' && password.trim() == '') {
          CustomSnackbar.show(context, 'Please enter a password');
        } else {
          CustomSnackbar.show(context, 'Please enter an email');
        }
      }
    }
    Turnloading();
  }

  Future<void> signUp(BuildContext context, String email, String password,
      String firstName, String lastName) async {
    Turnloading();
    int Except = 0;

    if (firstName.trim() == '' && lastName.trim() == '') {
      Except = 1;
      CustomSnackbar.show(
          context, 'Please provide a valid first name and last name');
    } else if (firstName.trim() == '' && lastName.trim() != '') {
      Except = 1;
      CustomSnackbar.show(context, 'Please provide a valid first name ');
    } else if (firstName.trim() != '' && lastName.trim() == '') {
      Except = 1;
      CustomSnackbar.show(context, 'Please provide a valid last name');
    } else {
      Except = 0;
    }

    if (Except == 0) {
      try {
        print('Sign Up button pressed');
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim());

        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          insertuser(user.uid, firstName.trim(), lastName.trim());
          fetchCurrentuser(user.uid);
        }

        Navigator.popUntil(context, (route) => route.isFirst);
      } catch (e) {
        print('firebase error');
        if (e is FirebaseAuthException &&
            email.trim() != '' &&
            password.trim() != '') {
          CustomSnackbar.show(context, '${e.message}');
        } else {
          if (email.trim() == '' && password.trim() == '')
            CustomSnackbar.show(context, 'Please enter an email and password');
          else if (email.trim() != '' && password.trim() == '')
            CustomSnackbar.show(context, 'Please enter a password');
          else
            CustomSnackbar.show(context, 'Please enter an email');
        }
      }
    }
    Turnloading();
  }
}
