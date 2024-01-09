class UserModel {
  final String name;
  final String email;
  final String password;

  UserModel({required this.name, required this.email, required this.password});
}

class MessageModel {
  final String message;
  final UserModel userA;
  final UserModel userB;
  final DateTime dateTime;

  MessageModel(
      {required this.message,
      required this.userA,
      required this.userB,
      required this.dateTime});
}

UserModel userModelA = UserModel(
    name: "Batuta", email: 'Saelbatita@gmail.com', password: "azerty");
UserModel userModelB =
    UserModel(name: "Nkuma", email: 'nkuma@outlook.com', password: "azerty");

MessageModel messageModel = MessageModel(
    message: "Hello World",
    userA: userModelA,
    userB: userModelB,
    dateTime: DateTime.now());
