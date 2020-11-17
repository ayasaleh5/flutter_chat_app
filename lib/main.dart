import 'package:chat_app/screens/Login/login_screen.dart';
import 'package:chat_app/screens/Welcome/welcome_screen.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        accentColor: Color(0xFFFEF9EB),
    ),
    home: StreamBuilder(stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, userSnapshot) {
      if(userSnapshot.hasData){
        return HomeScreen();
      }

            return WelcomeScreen();

        }),

    );
  }
}
