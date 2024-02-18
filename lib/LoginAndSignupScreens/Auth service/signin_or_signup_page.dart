import 'package:flutter/material.dart';
import 'package:instagramclone/LoginAndSignupScreens/Login/login_page.dart';
import 'package:instagramclone/LoginAndSignupScreens/Signup/sign_up_page.dart';
// import 'package:instagramclone/presentationn/pages/mainscreen/intro_screen/introscreen.dart';

class signInOrSignup extends StatefulWidget {
  const signInOrSignup({super.key});

  @override
  State<signInOrSignup> createState() => _signInOrSignupState();
}

class _signInOrSignupState extends State<signInOrSignup> {
  bool showLoadingPages = true;

  void togglePages() {
    setState(() {
      showLoadingPages = !showLoadingPages;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoadingPages) {
      return SignInPage(
        onTap: togglePages,
      );
    } else {
      return SignupPage(
        onTap: togglePages,
      );
    }
  }
}
