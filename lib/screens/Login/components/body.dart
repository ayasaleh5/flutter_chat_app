import 'package:chat_app/components/text_field_container.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/screens/Login/components/background.dart';
import 'package:chat_app/screens/Signup/signup_screen.dart';
import 'package:chat_app/components/already_have_an_account_acheck.dart';
import 'package:chat_app/components/rounded_button.dart';
import 'package:chat_app/components/rounded_input_field.dart';
import 'package:chat_app/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  Body(this.submitFn, this.isLoading);

  final bool isLoading;
  final void Function(
      String email,
      String password,
      BuildContext ctx,
      )submitFn;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey= GlobalKey<FormState>();
  var _userEmail = '';
  var _userPassword = '';
  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
          _userEmail.trim(),
          _userPassword.trim(),
          context
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            TextFieldContainer(
              child: TextFormField(
                validator:(value){
                  if(value.isEmpty || !value.contains('@')){
                    return 'Please enter a valid email address.';
                  }
                  return null;
                } ,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email_sharp,
                    color: kPrimaryColor,
                  ),
                  hintText: 'Email address',
                  border: InputBorder.none,
                ),
                onSaved: (value){
                  _userEmail = value;
                },
              ),

            ),
            TextFieldContainer(
              child: TextFormField(
                validator:(value){
                  if(value.isEmpty || value.length<7){
                    return 'Password must be at least 7 characters long.';
                  }
                  return null;
                } ,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  hintText: 'Password',
                  border: InputBorder.none,
                ),
                onSaved: (value){
                  _userPassword = value;
                },
              ),
            ),
            if(widget.isLoading)
              CircularProgressIndicator(),
            if(!widget.isLoading)
            RoundedButton(
              text: "LOGIN",
              press: _trySubmit,
                   /*() {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ),
                );
              },*/
            ),
            SizedBox(height: size.height * 0.03),
            if(!widget.isLoading)
              AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      ),
    );
  }
}
