// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagramclone/Bloc/counter_blocl.dart';
import 'package:instagramclone/Cubic/counter_cubic.dart';
import 'package:instagramclone/LoginAndSignupScreens/Auth%20service/authPage.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:instagramclone/Cubic/counter_cubic.dart';
// import 'package:instagramclone/LoginAndSignupScreens/Auth%20service/authPage.dart';
import 'package:instagramclone/cubic_home/counter_cubic_home.dart';
// import 'package:instagramclone/LoginAndSignupScreens/Login/login_page.dart';
// import 'package:instagramclone/presentationn/pages/LoginScreens/Login/login_page.dart';
// import 'package:instagramclone/presentationn/pages/mainscreen/home_screen/home_screen.dart';
// import 'package:instagramclone/presentationn/pages/mainscreen/intro_screen/introscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(

      /// default firebase options

      // options: DefaultFirebaseOptions.currentPlatform)

      /// firebase options in my json

      options: const FirebaseOptions(
          apiKey: 'AIzaSyC_uz4J-Lpmd4pVSwpv2jHFL2NNrO8sLiA',
          appId: '1:1004235482443:android:b1a0c2dcfa1104e558f4ce',
          messagingSenderId: '1004235482443',
          projectId: 'instagramclone-bd7b4'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterCubic(),
        ),
        BlocProvider(
          create: (context) => CounterBlock(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthPage(),
      ),
    );
  }
}
