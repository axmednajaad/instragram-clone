// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:instagramclone/LoginAndSignupScreens/Auth%20service/signin_or_signup_page.dart';
// import 'package:instagramclone/LoginAndSignupScreens/Signup/sign_up_page.dart';
import 'package:instagramclone/const%20theme/theme.dart';
import 'package:instagramclone/presentationn/pages/mainscreen/intro_screen/introscreen.dart';

class SignInPage extends StatefulWidget {
  final Function()? onTap;
  const SignInPage({
    super.key,
    this.onTap,

    // required this.onTap
  });

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _FormKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
                child: Form(
                    key: _FormKey,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(),
                        ),
                        Image.asset(
                          'assets/last insta logo.png',
                          color: primaryColor,
                          width: 160,
                          // height: 80,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          style: TextStyle(color: primaryColor, fontSize: 18),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Form must not be empty';
                            } else if (!value.contains('@') &&
                                !value.contains('.')) {
                              return 'Email is not correctly Formatted';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              hintText: 'Email',
                              hintStyle:
                                  TextStyle(color: primaryColor, fontSize: 18)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          // autocorrect: true,
                          // keyboardAppearance: Brightness.light,
                          controller: passwordController,
                          // enableInteractiveSelection: true,
                          enableSuggestions: true,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          style: TextStyle(color: primaryColor, fontSize: 18),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Form must not be empty';
                            } else if (value.length < 6) {
                              return 'Your characteristics must be at least 6 letter';
                            } else {
                              return null;
                            }
                            // if (value!.isEmpty) {
                            //   return '';
                            // } else {}
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              hintText: 'Password',
                              hintStyle:
                                  TextStyle(color: primaryColor, fontSize: 18)),
                        ),
                        GestureDetector(
                          onTap: () => signUserIn(),
                          child: Container(
                            width: 200,
                            padding: EdgeInsets.all(12),
                            margin: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                color: blueColor,
                                borderRadius: BorderRadius.circular(6)),
                            child: Text(
                              'Sign In',
                              style:
                                  TextStyle(color: primaryColor, fontSize: 22),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(),
                        ),
                        Divider(
                          color: secondaryColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't  have an account ?",
                                style: TextStyle(
                                    fontSize: 16, color: primaryColor),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              GestureDetector(
                                // onTap call the void function on the top in the final
                                onTap: widget.onTap,

                                // onTap: onTap,
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800,
                                      color: primaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  signUserIn() async {
    if (_FormKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );
      final auth = FirebaseAuth.instance;

      try {
        await auth
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then((value) => {
                  Navigator.pop(context),
                  Fluttertoast.showToast(
                      msg: "Account Login Successfully",
                      textColor: primaryColor,
                      fontSize: 22),
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => introScreen(),
                      ))
                });
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        if (e.code == 'user-not-found') {
          // No user found for that email
          Fluttertoast.showToast(msg: 'User not found');
        } else if (e.code == 'invalid-email') {
          // Email is invalid
          Fluttertoast.showToast(msg: 'invaild email address');
        } else if (e.code == 'wrong-password') {
          // Weak password
          Fluttertoast.showToast(msg: 'the password   is wrong');
        } else {
          // Any other errors
          Fluttertoast.showToast(msg: 'the error is ${e.message}');
        }
      }

      // Fluttertoast.showToast(
      // msg: "Account Login Successfully",
      // textColor: primaryColor,
      // fontSize: 22);
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => SuccessPage(),
      //     ));
    } else {
      return null;
    }
  }
}
