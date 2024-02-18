// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:instagramclone/LoginAndSignupScreens/Signup/sign_up_page.dart';
import 'package:instagramclone/const%20theme/theme.dart';

class SuccessPage extends StatelessWidget {
  SuccessPage({super.key});
  final User = FirebaseAuth.instance.currentUser!.toString() ;

  // final CurrentUser = FirebaseAuth.instance.currentUser!.updatePassword('123455');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          // iconTheme: IconThemeData(color: primaryColor, size: 32),

          actions: [
            // IconButton(
            // onPressed: ()
            // icon: Icon(Icons.logout))
          ],
        ),
        body: Center(
          child: Text('user email is : ${User} ',
              style: TextStyle(fontSize: 18, color: primaryColor)),
        ),
      ),
    );
  }
}
