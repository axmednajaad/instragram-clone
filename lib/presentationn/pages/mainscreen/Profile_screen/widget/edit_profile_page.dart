// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:instagramclone/const%20theme/theme.dart';
import 'package:instagramclone/presentationn/pages/mainscreen/Profile_screen/widget/profile_form_widget.dart';
import 'package:instagramclone/presentationn/pages/mainscreen/intro_screen/introscreen.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _UsernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    _UsernameController.dispose();
    _nameController.dispose();
    _bioController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              color: secondaryColor,
              size: 32,
            ),
          ),
          title: Text(
            'Edit Profile',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: primaryColor),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => introScreen()));
              },
              child: Icon(
                Icons.check,
                color: blueColor,
                size: 32,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: secondaryColor, shape: BoxShape.circle),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Change profile picture',
                        style: TextStyle(
                            color: blueColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ProfileFormWidget(
                controller: _nameController,
                text: 'Name',
              ),
              SizedBox(
                height: 10,
              ),
              ProfileFormWidget(
                controller: _UsernameController,
                text: 'Username',
              ),
              SizedBox(
                height: 10,
              ),
              ProfileFormWidget(
                controller: _websiteController,
                text: 'Website',
              ),
              SizedBox(
                height: 10,
              ),
              ProfileFormWidget(
                controller: _bioController,
                text: 'Bio',
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
