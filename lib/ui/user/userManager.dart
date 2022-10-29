import 'package:flutter/material.dart';
import '../../models/user.dart';

class UserManager with ChangeNotifier {
  final List _users = [
    User(
        userID: "1910295",
        mailAddr: "thaiB1910295@student.com",
        // mailAddr: "123",
        password: "12345"
    ),
    User(
        userID: "1910296",
        mailAddr: "thaingo1202@student.com",
        password: "12345"
    ),
  ];

  int get emailCount {
    return _users.length;
  }

  List get emails {
    return [..._users];
  }

  
  // return userID if log-in information is valid
  // return 'false' if it's wrong.
  String logIn(email, password) {
    String state = "false";
    for (var e in _users) {
      if (e.mailAddr == email && password == e.password) {
        return e.userID;
      }
    }
    return state;
  }

  
}
