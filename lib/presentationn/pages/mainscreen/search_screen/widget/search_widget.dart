// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagramclone/const%20theme/theme.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: darkGreyColor),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: primaryColor.withOpacity(.3)),
        decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(
              Icons.search,
              color: primaryColor,
            ),
            hintStyle: TextStyle(color: secondaryColor, fontSize: 15),
            border: InputBorder.none),
      ),
    );
  }
}
