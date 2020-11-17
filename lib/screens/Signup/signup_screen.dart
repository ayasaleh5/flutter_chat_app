import 'dart:io';

import 'package:chat_app/UserStatus/LoginStatus.dart';
import 'package:chat_app/screens/Login/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/screens/Signup/components/body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_screen.dart';
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;
  FirebaseUser loggedInUser;
  SharedPreferences  prefrences;

  void getcucrrentUser() async{
    try{
      final user = await _auth.currentUser();
      if(user!= null){
        loggedInUser = user;
      }
    }catch(e){
      print(e);
    }
  }

  void _submitAuthForm(
      String email,
      String password,
      String username,
      File image,
      BuildContext ctx,
      ) async {
    try{
      setState(() {
        _isLoading = true;
      });
 final newUser=  await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password);
      if(newUser != null) {
        getcucrrentUser();
        final ref = FirebaseStorage.instance.ref()
            .child('user_image')
            .child(newUser.uid+'.jpg');
        await ref.putFile(image).onComplete;
        final url = await ref.getDownloadURL();

        await Firestore.instance
            .collection('users')
            .document(newUser.uid)
            .setData({
          'username': username,
          'email' : email,
          'image_url' : url
        });
        LoginStatus().writeStatus(true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }

    }

  on PlatformException catch(err){
      var message = 'An error occurred, please check your credentials!';
      if(err.message !=null){
        message = err.message;
      }
      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
    } catch(err){
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
    setState(() {
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
          _submitAuthForm,
      _isLoading),
    );
  }
}
