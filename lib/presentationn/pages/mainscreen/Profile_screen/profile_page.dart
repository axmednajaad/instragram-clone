// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramclone/LoginAndSignupScreens/Auth%20service/signin_or_signup_page.dart';
import 'package:instagramclone/LoginAndSignupScreens/Login/login_page.dart';
import 'package:instagramclone/const%20theme/theme.dart';
import 'package:instagramclone/presentationn/pages/mainscreen/Profile_screen/widget/edit_profile_page.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final CurrentUser = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text(
            '$CurrentUser',
            style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                _openBottomModelSheet(context);
              },
              child: Icon(
                Icons.menu,
                color: primaryColor,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // padding: EdgeInsets.only(left: 60),
                      // margin: EdgeInsets.only(left: 10),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: secondaryColor),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              '300',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Posts',
                              style: TextStyle(
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Text(
                              '200K',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Followers',
                              style: TextStyle(color: primaryColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Text(
                              '500',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Following',
                              style: TextStyle(color: primaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              /////////
              /// Add Bio
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CurrentUser',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: primaryColor),
                    ),
                    Text(
                      'Add Bio',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: primaryColor),
                    )
                  ],
                ),
              ),
              ////
              SizedBox(
                height: 15,
              ),
              //// grid view section
              GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 21,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      width: 100,
                      color: darkGreyColor,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  _openBottomModelSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          decoration: BoxDecoration(
            color: backgroundColor.withOpacity(.8),
          ),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      'More options',
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Divider(
                    thickness: 1,
                    color: secondaryColor,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfilePage(),
                            ));
                      },
                      child: Text(
                        'Edit profile page',
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Divider(
                    thickness: 1,
                    color: secondaryColor,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: GestureDetector(
                      onTap: () {
                        //  final User = FirebaseAuth.instance.currentUser!;
                        FirebaseAuth.instance.signOut().then((value) => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => signInOrSignup(),
                                  )),
                            });
                      },
                      child: Text(
                        'Log out',
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Divider(
                    thickness: 1,
                    color: secondaryColor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
