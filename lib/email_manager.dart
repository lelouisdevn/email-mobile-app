import 'email.dart';
import 'package:flutter/material.dart';

class EmailManager with ChangeNotifier {
  final List _emails = [
    Email(
        sentFrom: "vanaB12345@student.com",
        content:
            "Chao ban, Toi la Vinh Thai, han hanh duoc lam quen voi cac ban, Toi la Vinh Thai, han hanh duoc lam quen voi cac ban",
        subject: "Chao cac ban nha. "),
    Email(
        sentFrom: "thaingo1202@outlook.com",
        content: "Don xin gia nhap",
        subject: "Chao ban"),
    Email(
        sentFrom: "thic@student.com",
        content: "Don xin nghi hoc",
        subject: "Nghi hoc"),
  ];
  int get emailCount {
    return _emails.length;
  }

  List get emails {
    return [..._emails];
  }
}
