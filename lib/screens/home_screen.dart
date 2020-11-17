import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/Login/login_screen.dart';
import 'package:chat_app/widgets/category_selector.dart';
import 'package:chat_app/widgets/favorite_contacts.dart';
import 'package:chat_app/widgets/recent_chats.dart';
import 'package:chat_app/widgets/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  int currentTab = 0;
  final List<Widget> screens = [
    RecentChats(),
    FavoriteContacts(),
    Settings(),
  ];
  Widget currentScreen = RecentChats();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('FlutterChat'),

        actions: <Widget> [
         IconButton(
           icon: Icon(
             Icons.person,
             color: Colors.white,
             size: MediaQuery.of(context).size.width* .07,
           ),
           onPressed: () async {
             checkCo
           }
         ),
        ],
      ),

      body: Column(
        children: <Widget>[
          Expanded(
      child: Container(
          decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )
        ),
            child: PageStorage(
              child: currentScreen,
              bucket: bucket,
            ),
          ),
          ),
    ],
    ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: (){
                  
                  setState(() {
                    currentScreen = RecentChats();
                    currentTab=0;
                  },);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.chat, color:currentTab ==0 ? kPrimaryColor : Colors.grey),
                    Text(
                      'Recent chats',
                      style: TextStyle(
                          color:currentTab ==0 ? kPrimaryColor : Colors.grey
                      ),
                    ),

                  ],),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: (){
                  setState(() {
                    currentScreen = FavoriteContacts();
                    currentTab=1;
                  },);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.supervised_user_circle, color:currentTab ==1 ? kPrimaryColor : Colors.grey),
                    Text(
                      'Users',
                      style: TextStyle(
                          color:currentTab ==1 ? kPrimaryColor : Colors.grey
                      ),
                    ),

                  ],),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: (){
                  setState(() {
                    currentScreen = Settings();
                    currentTab=2;
                  },);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.settings, color:currentTab ==2 ? kPrimaryColor : Colors.grey),
                    Text(
                      'Settings',
                      style: TextStyle(
                          color:currentTab ==2 ? kPrimaryColor : Colors.grey
                      ),
                    ),

                  ],),
              ),
            ],
          ),
        ),
      ),
    );
  }

}