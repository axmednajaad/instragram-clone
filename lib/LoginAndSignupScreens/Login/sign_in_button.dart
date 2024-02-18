// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagramclone/const%20theme/theme.dart';

class ButtonContainerWidget extends StatelessWidget {
  final Color? color;
  final String? text;
  final VoidCallback? onTapListener;

  const ButtonContainerWidget({super.key, this.onTapListener, this.color, this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapListener,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        child: Center(
            child: Text(
          "$text",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: primaryColor),
        )),
      ),
    );
  }
}
