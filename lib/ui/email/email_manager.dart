import 'package:flutter/material.dart';
import '../../models/email.dart';

class EmailManager with ChangeNotifier {
  final List _emails = [
    Email(
        userID: "1910295",
        sentFrom: "vanaB12345@student.com",
        content:
            "Chao ban, Toi la Vinh Thai, han hanh duoc lam quen voi cac ban, Toi la Vinh Thai, han hanh duoc lam quen voi cac ban",
        subject: "Chao cac ban nha. "),
    Email(
        userID: "1910295",
        sentFrom: "thaingo1202@outlook.com",
        content: "Don xin gia nhap",
        subject: "Chao ban Chao banChao banChao banChao ban"),
    Email(
        userID: "1910296",
        sentFrom: "thic@student.com",
        content: "Don xin nghi hoc",
        subject: "Nghi hoc"),
    Email(
        userID: "1910295",
        sentFrom: "thic@student.com",
        content: "Test",
        subject: "Nghi hoc"),
  ];
  int get emailCount {
    return _emails.length;
  }

  List get emails {
    return [..._emails];
    
  }

  int getEmails(String userID, int index) {
    if (_emails[index].userID == userID) {
      return 1;
    }
    return 0;
  }

  Email findById(String id) {
    return _emails.firstWhere((element) => element.id == id);
  }
}
