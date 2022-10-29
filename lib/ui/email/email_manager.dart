import 'package:flutter/material.dart';
import '../../models/email.dart';

class EmailManager with ChangeNotifier {
  final List _emails = [
    Email(
      userID: "1910295",
      sentFrom: "vanaB12345@student.com",
      sentTo: "thaiB1910295@student.com",
      content:
          "Chao ban, Toi la Vinh Thai, han hanh duoc lam quen voi cac ban, Toi la Vinh Thai, han hanh duoc lam quen voi cac ban",
      subject: "Chao cac ban nha. ",
    ),
    Email(
      userID: "1910295",
      sentFrom: "thaingo1202@outlook.com",
      sentTo: "thaiB1910295@student.com",
      content: "Don xin gia nhap",
      subject: "Don xin gia han dong hoc phi",
    ),
    Email(
      userID: "1910296",
      sentFrom: "thic@student.com",
      sentTo: "thaingo1202@student.com",
      content:
          "Email has existed in some form since the 1970s, when programmer Ray Tomlinson created a way to transmit messages between computer systems on the Advanced Research Projects Agency Network (ARPANET). Modern forms of email became available for widespread public use with the development of email client software (e.g. Outlook) and web browsers, the latter of which enables users to send and receive messages over the Internet using web-based email clients (e.g. Gmail). Email has existed in some form since the 1970s, when programmer Ray Tomlinson created a way to transmit messages between computer systems on the Advanced Research Projects Agency Network (ARPANET). Modern forms of email became available for widespread public use with the development of email client software (e.g. Outlook) and web browsers, the latter of which enables users to send and receive messages over the Internet using web-based email clients (e.g. Gmail). Email has existed in some form since the 1970s, when programmer Ray Tomlinson created a way to transmit messages between computer systems on the Advanced Research Projects Agency Network (ARPANET). Modern forms of email became available for widespread public use with the development of email client software (e.g. Outlook) and web browsers, the latter of which enables users to send and receive messages over the Internet using web-based email clients (e.g. Gmail).",
      subject: "Nghi hoc",
    ),
    Email(
      userID: "1910295",
      sentFrom: "thic@student.com",
      sentTo: "thaiB1910295@student.com",
      content: "Test",
      subject: "Nghi hoc",
    ),
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

  Email getSentEmails(String userID) {
    return _emails[1];
  }
}
