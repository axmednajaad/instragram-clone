// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:instagramclone/const%20theme/theme.dart';

class EditPostPage extends StatelessWidget {
  const EditPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: primaryColor),
        backgroundColor: backgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.done,
              size: 35,
              color: blueColor,
            ),
          )
        ],
        title: Text(
          'Edit Post',
          style: TextStyle(
              color: primaryColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: secondaryColor, shape: BoxShape.circle),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Username',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .3,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: secondaryColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Description',
                style: TextStyle(color: primaryColor, fontSize: 17),
              ),
              TextFormField(
                style: TextStyle(color: primaryColor),
                // decoration: InputDecoration(
                //     // hintStyle: TextStyle(color: primaryColor),
                //     // border: InputBorder.none
                //     ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
