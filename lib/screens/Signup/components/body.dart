import 'dart:io';

import 'package:chat_app/components/already_have_an_account_acheck.dart';
import 'package:chat_app/components/rounded_button.dart';
import 'package:chat_app/components/rounded_input_field.dart';
import 'package:chat_app/components/rounded_password_field.dart';
import 'package:chat_app/components/text_field_container.dart';
import 'package:chat_app/screens/Login/login_screen.dart';
import 'package:chat_app/screens/Signup/components/social_icon.dart';
import 'package:chat_app/widgets/user_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'background.dart';
import 'or_divider.dart';
class Body extends StatefulWidget {
  Body(this.submitFn, this.isLoading);

  final bool isLoading;
  final void Function(
      String email,
      String password,
      String userName,
      File image,
      BuildContext ctx,
      )submitFn;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey= GlobalKey<FormState>();
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _userImageFile;

  void __pickedImage(File image){
    _userImageFile = image;
  }
  void _trySubmit(){
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if(_userImageFile == null){
      Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Please pick an image'),
            backgroundColor: Theme.of(context).errorColor,
          ),
      );
      return;
    }
    if(isValid){
      _formKey.currentState.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        _userName.trim(),
          _userImageFile,
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
              UserImagePicker(__pickedImage),
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
                    if(value.isEmpty || value.length<4){
                      return 'Please enter at least 4 characters.';
                    }
                    return null;
                  } ,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    hintText: 'User Name',
                    border: InputBorder.none,
                  ),
                  onSaved: (value){
                    _userName = value;
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
                text: "SIGNUP",
                press: _trySubmit,
              ),
                SizedBox(height: size.height * 0.03),
              if(!widget.isLoading)
                AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
