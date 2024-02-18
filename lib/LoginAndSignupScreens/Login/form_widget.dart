// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:instagramclone/const%20theme/theme.dart';

class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldkey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  // final FormFieldSetter<String>? validator;
// fianl ValueChanged<String>?  onFieldSubmitted;
  final TextInputType? inputType;

  const FormContainerWidget({
    super.key,
    this.controller,
    this.fieldkey,
    this.helperText,
    this.hintText,
    this.inputType,
    this.isPasswordField,
    this.labelText,
    // this.onFieldSubmitted,
    this.onSaved,
    // this.validator
  });

  @override
  State<FormContainerWidget> createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obsecureText = false;
  bool isPasswordField = false;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      // autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: secondaryColor.withOpacity(.35)),
        child: new TextFormField(
          style: TextStyle(color: primaryColor),
          controller: widget.controller,
          keyboardType: widget.inputType,

          key: widget.fieldkey,
          obscureText: widget.isPasswordField == true ? _obsecureText : false,
          // onSaved: Widget.onSaved,
          // validator: Widget.validator,
          // onFieldSubmitted: Widget.onFieldSubmitted,
          decoration: new InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
              fillColor: darkGreyColor,
              filled: true,
              hintStyle: TextStyle(color: primaryColor),
              suffixIcon: new GestureDetector(
                  onTap: () {
                    setState(() {
                      _obsecureText = !_obsecureText;
                    });
                  },
                  child:
                      // Widget.isPasswordField == true ?
                      widget.isPasswordField == true
                          ? Icon(
                              _obsecureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: _obsecureText == false
                                  ? blueColor
                                  : secondaryColor,
                            )
                          : Text(''),
                          
                          ),
                          
                          ),
        ),
      ),
    );
  }
}
