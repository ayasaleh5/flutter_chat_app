
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget{
  @override
  _NewMessage createState() => _NewMessage();
}
class _NewMessage extends State<NewMessage>{
  final _controller = new TextEditingController();
  var _enteredMessage='';
void _sendMessage()async{
  FocusScope.of(context).unfocus();
  final user = await FirebaseAuth.instance.currentUser();
  final userData = await Firestore.instance.collection('users')
      .document(user.uid).get();
  Firestore.instance.collection('chat').add({
    'text': _enteredMessage,
    'createdAt' :Timestamp.now(),
    'userId' :user.uid,
    'username': userData['username'],
    'userImage': userData['image_url']
  });
  _controller.clear();
}
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[

          Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration.collapsed(
                    hintText: 'Send a message...'),
                textCapitalization: TextCapitalization.sentences,
                onChanged: (value){
                  setState(() {
                    _enteredMessage = value;
                  });
                },

              )
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed:_enteredMessage.trim().isEmpty? null : _sendMessage,
          ),
        ],
      ),
    );
  }

}