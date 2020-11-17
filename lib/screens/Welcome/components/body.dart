import 'package:flutter/material.dart';
import 'package:chat_app/screens/Login/login_screen.dart';
import 'package:chat_app/screens/Signup/signup_screen.dart';
import 'package:chat_app/screens/Welcome/components/background.dart';
import 'package:chat_app/components/rounded_button.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
      Future.delayed(
        Duration(seconds: 4),
          (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>LoginScreen(),
              ),
          );
          }
      );

  }
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),

          ],
        ),
      ),
    );
  }


}
