// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagramclone/const%20theme/theme.dart';

class ProfileFormWidget extends StatelessWidget {
  const ProfileFormWidget({super.key, this.text, this.controller});
  final String? text;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$text',
          style: TextStyle(
              color: primaryColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextFormField(
            controller: controller,
            style: TextStyle(color: primaryColor),
            decoration: InputDecoration(
                border: InputBorder.none,
                labelStyle: TextStyle(color: primaryColor)),
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: secondaryColor,
        ),
      ],
    );
  }
}
