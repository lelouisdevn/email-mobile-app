import 'package:flutter/material.dart';
import '../../models/user.dart';

class UserManager with ChangeNotifier {
  final List _users = [
    User(
        userID: "1910295",
        mailAddr: "thaiB1910295@student.com",
        password: "12345"),
    User(
      userID: "1910296",
      mailAddr: "thaingo1202@student.com",
      password: "12345",
    ),
    User(
      userID: "1910297",
      mailAddr: "example@atlan.com",
      password: "pass",
    ),
  ];

  int get emailCount {
    return _users.length;
  }

  List get emails {
    return [..._users];
  }

  // login for user:
  String logIn(email, password) {
    String state = "false";
    for (var e in _users) {
      if (e.mailAddr == email && password == e.password) {
        return e.userID;
      }
    }
    return state;
  }

  // get id of the last user:
  int getLastUserID() {
    int max = 0;
    for (var index = 0; index < _users.length; index++) {
      var temp = int.parse(_users[index].userID);
      if (temp > max) {
        max = temp;
      }
    }
    return max;
  }

  // create new user
  String createNewUser(User newUser) {
    newUser.userID = (getLastUserID() + 1).toString();
    _users.add(newUser);
    return newUser.userID;
  }
}
