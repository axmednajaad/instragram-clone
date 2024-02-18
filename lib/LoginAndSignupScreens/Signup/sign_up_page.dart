// ignore_for_file: prefer_const_constructors, unused_import, non_constant_identifier_names, use_build_context_synchronously

import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instagramclone/LoginAndSignupScreens/Auth%20service/signin_or_signup_page.dart';
import 'package:instagramclone/LoginAndSignupScreens/Login/login_page.dart';
import 'package:instagramclone/LoginAndSignupScreens/Login/sign_in_button.dart';
import 'package:instagramclone/LoginAndSignupScreens/SuccessPage/succesPage.dart';
import 'package:instagramclone/const%20theme/theme.dart';
import 'package:instagramclone/presentationn/pages/mainscreen/intro_screen/introscreen.dart';

// import 'package:instagramclone/presentationn/pages/LoginScreens/Login/sign_in_button.dart';

import '../Login/form_widget.dart';

class SignupPage extends StatefulWidget {
  final Function()? onTap;
  const SignupPage({super.key, required this.onTap});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameconroller = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  final GlobalKey<FormState> _FormKey = GlobalKey();

  // bool isSignup = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameconroller.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

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
                          controller: usernameconroller,
                          style: TextStyle(color: primaryColor, fontSize: 18),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Form must not be empty';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              hintText: 'Username',
                              hintStyle:
                                  TextStyle(color: primaryColor, fontSize: 18)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: primaryColor, fontSize: 18),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Form must not be empty';
                            } else if (!value.contains('@')) {
                              return 'Email format is not correct';
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
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          style: TextStyle(color: primaryColor, fontSize: 18),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Form must not be empty';
                            } else if (value.length < 6) {
                              return 'Your password characteristics must be at least 6 letter';
                            } else if (value != confirmPassword.text) {
                              return 'Your password does not match  the confirm password';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              hintText: 'Password',
                              hintStyle:
                                  TextStyle(color: primaryColor, fontSize: 18)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: confirmPassword,
                          obscureText: true,
                          style: TextStyle(color: primaryColor, fontSize: 18),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Form must not be empty';
                            } else if (value.length < 6) {
                              return 'Your confirm password must be at least 6 characters long';
                            } else if (value != passwordController.text) {
                              return 'Your confirm password does not match the password';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            hintText: 'Confirm password',
                            hintStyle:
                                TextStyle(color: primaryColor, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () => signUserUp(),
                          child: Container(
                            // width: 200,
                            padding: EdgeInsets.all(25),
                            margin: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                color: blueColor,
                                borderRadius: BorderRadius.circular(10)),
                            child:

                                // isSignup == true
                                //     ? CircularProgressIndicator(
                                //         color: primaryColor,
                                //       )
                                //     :
                                Text(
                              'Sign up',
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
                                "Already have an account ?",
                                style: TextStyle(
                                    fontSize: 16, color: primaryColor),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              GestureDetector(
                                onTap: widget.onTap,
                                child: Text(
                                  'Sign in',
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

  signUserUp() async {
    if (_FormKey.currentState!.validate()) {
      // setState(() => isSignup = true);
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );
      final auth = FirebaseAuth.instance;

      try {
        await auth
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then((value) => {
                  // setState(() => isSignup = false);
                  Navigator.pop(context),
                  Fluttertoast.showToast(msg: "Account Created Successfully"),
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => introScreen(),
                      )),
                });
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);

        if (e.code == 'email-already-in-use') {
          //   User with the given email already exists
          Fluttertoast.showToast(
              msg: 'the account  for that email address already exists');
        } else if (e.code == 'invalid-email') {
          // The provided email is not valid
          Fluttertoast.showToast(msg: 'invaild email address');
        } else if (e.code == 'weak-password') {
          // The user attempted to sign in with a weak password.

          Fluttertoast.showToast(msg: 'the password is not stronger enough');
        } else {
          Fluttertoast.showToast(msg: 'the error is ${e.message}');
        }
      }
    } else {
      return null;
    }
  }
}

/////////////////////////////
///
///
//  Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Flexible(
//               flex: 2,
//               child: Container(),
//             ),
//             Image.asset(
//               'assets/last insta logo.png',
//               height: 120,
//               width: 120,
//               color: primaryColor,
//             ),
//             Stack(
//               children: [
//                 Container(
//                   height: 80,
//                   width: 80,
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle, color: secondaryColor),
//                   child: Icon(
//                     Icons.person_2,
//                     color: primaryColor,
//                     size: 33,
//                   ),
//                 ),
//                 Positioned(
//                     right: 2,
//                     // top: 5,
//                     bottom: 3,
//                     child: Icon(
//                       Icons.add_a_photo,
//                       color: primaryColor,
//                     ))
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             FormContainerWidget(
//               hintText: 'Username',
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             FormContainerWidget(
//               hintText: 'Email',
//               controller: emailController,
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             FormContainerWidget(
//               controller: passwordController,
//               hintText: 'Password',
//               isPasswordField: true,
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             FormContainerWidget(
//               hintText: 'Enter Your Bio',
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ButtonContainerWidget(
//               color: blueColor,
//               text: 'Sign In',
//               onTapListener: () {},
//             ),
//             Flexible(
//               flex: 2,
//               child: Container(),
//             ),
//             Divider(
//               color: secondaryColor,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Already have an account ?",
//                   style: TextStyle(color: primaryColor),
//                 ),
//                 SizedBox(
//                   width: 4,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     // Navigator.pushReplacementNamed(context, '/SignupPage');
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SignInPage(),
//                         ));
//                   },
//                   child: Text(
//                     'Sign in',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w800, color: primaryColor),
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
