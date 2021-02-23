import 'package:greylux_mobile/chatImport/models/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({this.sender, this.time, this.text, this.isLiked, this.unread});
}

final User currentUser =
    User(id: 0, name: 'Sena', imageUrl: 'assets/images/sena.jpg');
final User yui = User(id: 1, name: 'Yui', imageUrl: 'assets/images/yui.jpg');

//Favorite Contacts
List<User> favorites = [yui];

// Example chats in chat screen
List<Message> messages = [
  Message(
      sender: currentUser,
      time: '5:36 PM',
      text: "Aamiin",
      isLiked: true,
      unread: true),
  Message(
      sender: yui,
      time: '5:30 PM',
      text: "Semoga mamah cepet sadar :')",
      isLiked: true,
      unread: false),
  Message(
      sender: currentUser,
      time: '5:36 PM',
      text: "Mungkin nanti pada saatnya mamah pulang",
      isLiked: true,
      unread: true),
  Message(
      sender: yui,
      time: '5:30 PM',
      text: "Mamah kemana?",
      isLiked: true,
      unread: false),
  Message(
      sender: yui,
      time: '5:36 PM',
      text: "Kangen sama mamah :(",
      isLiked: false,
      unread: true),
  Message(
      sender: yui,
      time: '7:30 PM',
      text: "Mudah-mudahan mamah cepet pulang :')",
      isLiked: false,
      unread: true),
  Message(
      sender: currentUser,
      time: '5:36 PM',
      text: "Aamiin",
      isLiked: true,
      unread: true),
  Message(
      sender: yui,
      time: '5:30 PM',
      text: "Semoga mamah cepet sadar :')",
      isLiked: true,
      unread: false),
  Message(
      sender: currentUser,
      time: '5:36 PM',
      text: "Mungkin nanti pada saatnya mamah pulang",
      isLiked: true,
      unread: true),
  Message(
      sender: yui,
      time: '5:30 PM',
      text: "Mamah kemana?",
      isLiked: true,
      unread: false),
  Message(
      sender: yui,
      time: '5:36 PM',
      text: "Kangen sama mamah :(",
      isLiked: false,
      unread: true),
  Message(
      sender: yui,
      time: '7:30 PM',
      text: "Mudah-mudahan mamah cepet pulang :')",
      isLiked: false,
      unread: true)
];
