import 'package:flutter/material.dart';
import '../../models/email.dart';

class EmailManager with ChangeNotifier {
  final List _emails = [
    Email(
      sentFrom: "vanaB12345@student.com",
      sentTo: "thaiB1910295@student.com",
      content:
          "Chao ban, Toi la Vinh Thai, han hanh duoc lam quen voi cac ban, Toi la Vinh Thai, han hanh duoc lam quen voi cac ban",
      subject: "Chao cac ban nha. ",
      status: "true",
    ),
    Email(
      sentFrom: "thaiB1910295@student.com",
      sentTo: "vanaB12345@student.com",
      content:
          "Chao ban, Toi la Vinh Thai, han hanh duoc lam quen voi cac ban, Toi la Vinh Thai, han hanh duoc lam quen voi cac ban",
      subject: "Chao cac ban nha. ",
      status: "true",
    ),
    Email(
      sentFrom: "thaingo1202@student.com",
      sentTo: "thaiB1910295@student.com",
      content: "Don xin gia nhap",
      subject: "Don xin gia han dong hoc phi",
      status: "false",
    ),
    Email(
      sentFrom: "thic@student.com",
      sentTo: "thaingo1202@student.com",
      content:
          "Email has existed in some form since the 1970s, when programmer Ray Tomlinson created a way to transmit messages between computer systems on the Advanced Research Projects Agency Network (ARPANET). Modern forms of email became available for widespread public use with the development of email client software (e.g. Outlook) and web browsers, the latter of which enables users to send and receive messages over the Internet using web-based email clients (e.g. Gmail). Email has existed in some form since the 1970s, when programmer Ray Tomlinson created a way to transmit messages between computer systems on the Advanced Research Projects Agency Network (ARPANET). Modern forms of email became available for widespread public use with the development of email client software (e.g. Outlook) and web browsers, the latter of which enables users to send and receive messages over the Internet using web-based email clients (e.g. Gmail). Email has existed in some form since the 1970s, when programmer Ray Tomlinson created a way to transmit messages between computer systems on the Advanced Research Projects Agency Network (ARPANET). Modern forms of email became available for widespread public use with the development of email client software (e.g. Outlook) and web browsers, the latter of which enables users to send and receive messages over the Internet using web-based email clients (e.g. Gmail).",
      subject: "Nghi hoc",
      status: "false", // deleted
    ),
    // Email(
    //   sentFrom: "thic@student.com",
    //   sentTo: "thaiB1910295@student.com",
    //   content: "Test",
    //   subject: "Nghi hoc",
    //   status: "true",
    // ),
    Email(
      sentFrom: "thaingo1202@student.com",
      sentTo: "mystericuser@student.com",
      content: "Test",
      subject: "Nghi hoc",
      status: "true",
    ),
  ];
  int get emailCount {
    return _emails.length;
  }

  List get emails {
    return [..._emails];
  }

  // get inbox emails (sentTo == email address of the current logged-in user)
  int getInboxEmails(String userEmail, int index) {
    if (_emails[index].sentTo == userEmail && _emails[index].status == "true") {
      return 1;
    }
    return 0;
  }

  Email findById(String id) {
    return _emails.firstWhere((element) => element.id == id);
  }

  int getSentEmails(String email, int index) {
    if (_emails[index].sentFrom == email && _emails[index].status == "true") {
      return 1;
    }
    return 0;
  }

  // this function will be called when users send their mails.
  void addEmails(Email newEmail) {
    _emails.add(newEmail);
    notifyListeners();
  }

  void moveToTrash(index) {
    _emails[index].status == "true"
    ? _emails[index].status = "false"
    : _emails[index].status = "true";
    notifyListeners();
  }

  // Delete the selected email when trigger the "dismissible" or "delete icon".
  void deleteEmail(int index) {
    _emails.removeAt(index);
    notifyListeners();
  }

  int getDeletedEmails(mailaddr, index) {
    if (_emails[index].status == "false" &&
        (_emails[index].sentFrom == mailaddr ||
            _emails[index].sentTo == mailaddr)) {
      return 1;
    }
    return 0;
  }

  List search(thisUser, query) {
    var results = [];
    for (var i = 0; i < _emails.length; i++) {
      if (_emails[i].subject == query &&
          (_emails[i].sentFrom == thisUser || _emails[i].sentTo == thisUser)) {
        results.add(_emails[i]);
      }
    }
    return results;
  }
}
