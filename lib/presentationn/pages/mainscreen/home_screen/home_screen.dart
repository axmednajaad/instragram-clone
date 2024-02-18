// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagramclone/const%20theme/theme.dart';
// import 'package:instagramclone/presentationn/pages/mainscreen/Profile_screen/widget/edit_profile_page.dart';
import 'package:instagramclone/presentationn/pages/mainscreen/home_screen/comment/comment_pae.dart';
import 'package:instagramclone/presentationn/pages/mainscreen/home_screen/posts/edit_post_page.dart';
// import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final CurrentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   title: Padding(
          //     padding: const EdgeInsets.only(right: 0),
          //     child: Image.asset(
          //       'assets/insta logo.png',
          //       color: primaryColor,
          //     ),
          //     // child: Text(
          //     //   'Instagram',
          //     //   style: TextStyle(color: primaryColor),
          //     // ),
          //   ),
          //   actions: [
          //     Padding(
          //       padding: const EdgeInsets.only(right: 30),
          //       child: Icon(
          //         CommunityMaterialIcons.facebook_messenger,
          //         color: primaryColor,
          //         size: 32,
          //       ),
          //     )
          //   ],
          // ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title section
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/last insta logo.png',
                          height: 100,
                          width: 130,
                          color: Colors.white,
                        ),
                        Icon(
                          CommunityMaterialIcons.facebook_messenger,
                          color: primaryColor,
                          size: 32,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              /// User post section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: secondaryColor),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'CurrentUser.displayName',
                          style: TextStyle(color: primaryColor),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        _openBottomModelSheet(context);
                      },
                      child: Icon(
                        Icons.more_vert,
                        color: primaryColor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              /// post container
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                color: secondaryColor,
              ),

              SizedBox(
                height: 10,
              ),

              /// like section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: primaryColor,
                        size: 30,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CommentPage(),
                              ));
                        },
                        child: Icon(
                          CupertinoIcons.bubble_right,
                          // CommunityMaterialIcons.thought_bubble_outline,
                          // Icons.chat,
                          // Icons.chat_bubble_outline_sharp,
                          color: primaryColor,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Icon(
                        // CommunityMaterialIcons.send,

                        Icons.share,
                        color: primaryColor,
                        size: 30,
                      )
                    ],
                  ),
                  Icon(
                    Icons.bookmark_border,
                    color: primaryColor,
                    size: 30,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),

              ///
              ///
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'usernsme',
                        style: TextStyle(
                            color: primaryColor, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Some Description',
                        style: TextStyle(color: primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'view all comments',
                    style: TextStyle(
                      color: darkGreyColor,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '10/1/2023',
                    style: TextStyle(
                      color: darkGreyColor,
                    ),
                  ),
                ],
              ),
            ],
          )),
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
                      // onTap: () {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => EditProfilePage(),
                      //       ));
                      // },
                      child: Text(
                        'Delete Post',
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditPostPage(),
                            ));
                      },
                      // onTap: () {
                      //   Navigator.push(context, MaterialPageRoute(builder: (context) => EditPostPage()),
                      // },
                      child: Text(
                        'Update Post',
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
