import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget{
  UserImagePicker(this.imagePickFn);
  final Function(File pickedImage) imagePickFn;
  @override
   _UserImagePicker createState() => _UserImagePicker();
}

class _UserImagePicker extends State<UserImagePicker>{
  File _pickedImage;
  void _pickImage() async{
   // final pickedImageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(
        source: ImageSource.camera,
        imageQuality: 50,
        maxWidth: 150);
    final pickedImageFile = File(pickedImage.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    widget.imagePickFn(pickedImageFile);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          backgroundColor:Colors.grey ,
          radius: 40,
          backgroundImage: _pickedImage != null ? FileImage(_pickedImage) : null,
        ),
        FlatButton.icon(
          textColor: Theme.of(context).primaryColor,
          onPressed:_pickImage ,
          icon: Icon(Icons.image),
          label: Text('Add Image'),
        )
      ],
    );

  }
}