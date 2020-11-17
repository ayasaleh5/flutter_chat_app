import 'package:chat_app/models/user_model.dart';
class Message{
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;
  Message({
    this.sender,
    this.time,
    this.isLiked,
    this.unread,
    this.text,
  });
}
// you-current user

final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/greg.jpg'
);
//users
final User greg = User(
    id: 1,
    name: 'Greg',
    imageUrl: 'assets/images/greg.jpg'
);
final User james = User(
    id: 2,
    name: 'James',
    imageUrl: 'assets/images/james.jpg'
);
final User john = User(
    id: 3,
    name: 'John',
    imageUrl: 'assets/images/john.jpg'
);
final User olivia = User(
    id: 4,
    name: 'Olivia',
    imageUrl: 'assets/images/olivia.jpg'
);
final User sam = User(
    id: 5,
    name: 'Sam',
    imageUrl: 'assets/images/sam.jpg'
);
final User steven = User(
    id: 6,
    name: 'Steven',
    imageUrl: 'assets/images/steven.jpg'
);
   List<User> favorites=[sam,steven,olivia,john,greg];
   List<Message>chats =[
     Message(
       sender: james,
       time: '5:30 pm',
       text: 'Hey, How are u',
       isLiked: false,
       unread: true,
     ),
     Message(
       sender: olivia,
       time: '4:30 pm',
       text: 'i miss you',
       isLiked: false,
       unread: true,
     ),
     Message(
       sender: john,
       time: '3:15 pm',
       text: 'hey dude',
       isLiked: false,
       unread: false,
     ),
     Message(
       sender: steven,
       time: '2:30 pm',
       text: 'good night',
       isLiked: false,
       unread: true,
     ),
     Message(
       sender: sam,
       time: '2:00 pm',
       text: 'i ate so much food',
       isLiked: false,
       unread: false,
     )
   ];
   // list message in chat screen
List<Message>messages =[
  Message(
    sender: james,
    time: '5:30 pm',
    text: 'Hey, How are u',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 pm',
    text: 'just walked my dog',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:15 pm',
    text: 'all the food',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 pm',
    text: 'what kind of food',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 pm',
    text: 'i ate so much food',
    isLiked: false,
    unread: false,
  )
];
