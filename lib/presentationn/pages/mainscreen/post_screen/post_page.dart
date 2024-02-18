// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagramclone/const%20theme/theme.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: darkGreyColor,
          ),
          child: Icon(
            Icons.upload,
            size: 90,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
