
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget{
  @override
  _CategorySelector createState() => _CategorySelector();
}
class _CategorySelector extends State<CategorySelector>{
  int selectedIndex = 0;
  final List<String> categories=['Chats','Users'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              // make index white when tap on it
              onTap: (){
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Text(
                  categories[index],
                  style:TextStyle(
                    color: index== selectedIndex? Colors.white : Colors.white60,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ) ,
                ),

              ),
            );
          },
      ),

    );
  }

}