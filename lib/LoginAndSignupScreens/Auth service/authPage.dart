import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramclone/LoginAndSignupScreens/Auth%20service/signin_or_signup_page.dart';
import 'package:instagramclone/presentationn/pages/mainscreen/intro_screen/introscreen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          ///  user is logged in

          if (snapshot.hasData) {
            return const introScreen();
          }
          // user is not logged in
          else {
            return const signInOrSignup();
          }
        },
      ),
    );
  }
}
