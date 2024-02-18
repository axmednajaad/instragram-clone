// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:instagramclone/const%20theme/theme.dart';
// import 'package:instagramclone/presentationn/pages/LoginScreens/Login/form_widget.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  bool _isUserReplaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CommunityMaterialIcons.arrow_left,
            color: primaryColor,
            size: 30,
          ),
        ),
        title: Text(
          'Comments',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: secondaryColor),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'UserName',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'This is very beautiful place',
              style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              height: 1,
              color: secondaryColor,
            ),
            SizedBox(
              height: 16,
            ),
            ///////  COMMENTS AND REPLY  SECTION
            Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // profile iamge || username || comment || date || reply || view
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // profile image
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: secondaryColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            ////// username comment date reply and view
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Username',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Comments',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    //date
                                    Text(
                                      '15/Aug/2021',
                                      style: TextStyle(
                                          fontSize: 16,
                                          // fontWeight: FontWeight.bold,
                                          color: primaryColor),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),

                                    /// reply

                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isUserReplaying = !_isUserReplaying;
                                        });
                                      },
                                      child: Text(
                                        'Reply',
                                        style: TextStyle(
                                            fontSize: 16,
                                            // fontWeight: FontWeight.bold,
                                            color: primaryColor),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),

                                    ///
                                    // view
                                    Text(
                                      'View Replays',
                                      style: TextStyle(
                                          fontSize: 16,
                                          // fontWeight: FontWeight.bold,
                                          color: primaryColor),
                                    ),
                                  ],
                                ),
                                _isUserReplaying == true
                                    ? SizedBox(
                                        height: 10,
                                      )
                                    : SizedBox(
                                        height: 0,
                                      ),
                                //// replay here
                                _isUserReplaying == true
                                    ? SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            // FormContainerWidget(
                                            //   hintText: 'Post your replay....',
                                            // ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              height: 40,
                                              width: 271,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: secondaryColor),
                                              child: TextFormField(
                                                style: TextStyle(
                                                    color: primaryColor),
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText:
                                                        'Replay here...........',
                                                    hintStyle: TextStyle(
                                                        color: primaryColor,
                                                        fontSize: 16)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Post',
                                              style: TextStyle(
                                                  color: blueColor,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(
                                        width: 0,
                                        height: 0,
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: secondaryColor,
                        size: 30,
                      )
                    ],
                  ),
                ],
              ),
            ),

            //// owner comment section in the bottom
            _commentPost()
          ],
        ),
      ),
    );
  }

  _commentPost() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 55,
      color: Colors.grey[800],
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration:
                BoxDecoration(color: secondaryColor, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextFormField(
              style: TextStyle(color: primaryColor),
              decoration: InputDecoration(
                  hintText: 'Post Your Comment....',
                  hintStyle: TextStyle(color: secondaryColor),
                  border: InputBorder.none),
            ),
          ),
          Text(
            'Post',
            style: TextStyle(color: blueColor, fontSize: 15),
          )
        ],
      ),
    );
  }
}
