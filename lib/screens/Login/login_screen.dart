import 'package:chat_app/UserStatus/LoginStatus.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/screens/Login/components/body.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  SharedPreferences  prefrences;
  FirebaseUser currentUser;


  var _isLoading = false;

  void _submitAuthForm(
      String email,
      String password,
      BuildContext ctx,
      ) async {
    try{
      setState(() {
        _isLoading = true;
      });
     final newUser=  await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(newUser != null) {
        LoginStatus().writeStatus(true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on PlatformException catch(err){
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
      body: Body(_submitAuthForm,_isLoading),
    );
  }
}
