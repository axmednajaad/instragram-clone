// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:instagramclone/presentationn/pages/mainscreen/Profile_screen/profile_page.dart';
import 'package:instagramclone/presentationn/pages/mainscreen/activity_screen/activity_page.dart';
import 'package:instagramclone/presentationn/pages/mainscreen/home_screen/home_screen.dart';
import 'package:instagramclone/presentationn/pages/mainscreen/post_screen/post_page.dart';
import 'package:instagramclone/presentationn/pages/mainscreen/search_screen/search_page.dart';
import 'package:ionicons/ionicons.dart';
import 'package:instagramclone/const%20theme/theme.dart';

class introScreen extends StatefulWidget {
  const introScreen({super.key});

  @override
  State<introScreen> createState() => _introScreenState();
}

class _introScreenState extends State<introScreen> {
  int _selctedIndex = 0;

  late PageController pageController;
// this is allows us
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

// to avoid memory lose
  @override
  dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// this function increments  the selected index and navigates to next screen
  void onPageChange(int index) {
    setState(() {
      _selctedIndex = index;
    });
  }

  /// this function allows us to swap pages arroung by vertical or horizental
  void navigationTapped(int index) {
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: CupertinoTabBar(
          currentIndex: _selctedIndex,
          onTap: navigationTapped,
          backgroundColor: backgroundColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  CommunityMaterialIcons.home_variant,
                  color: primaryColor,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Ionicons.search,
                  color: primaryColor,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  // Ionicons.add_circle,
                  // CommunityMaterialIcons.circle,
                  CupertinoIcons.add_circled,
                  color: primaryColor,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: primaryColor,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  color: primaryColor,
                ),
                label: ''),
          ]),
      body: PageView(
        controller: pageController,
        children: [
          HomeScreen(),
          SearchScreen(),
          PostScreen(),
          ActivityScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
