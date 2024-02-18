// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagramclone/const%20theme/theme.dart';
import 'package:instagramclone/presentationn/pages/mainscreen/search_screen/widget/search_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController SearchController = TextEditingController();

  @override
  void dispose() {
    SearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchWidget(controller: SearchController),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: 21,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      width: 100,
                      color: secondaryColor,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
