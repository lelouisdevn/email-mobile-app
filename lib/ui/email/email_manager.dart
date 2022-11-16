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
      at: DateTime(2022, 10, 1, 12, 10),
    ),
    Email(
      sentFrom: "thaiB1910295@student.com",
      sentTo: "vanaB12345@student.com",
      content:
          "Chao ban, Toi la Vinh Thai, han hanh duoc lam quen voi cac ban, Toi la Vinh Thai, han hanh duoc lam quen voi cac ban",
      subject: "Chao cac ban nha. ",
      status: "true",
      at: DateTime(2022, 3, 26, 15, 35),
    ),
    Email(
      sentFrom: "thaingo1202@student.com",
      sentTo: "thaiB1910295@student.com",
      content: "Don xin gia nhap",
      subject: "Don xin gia han dong hoc phi",
      status: "false",
      at: DateTime(2022, 10, 20, 19, 10),
    ),
    Email(
      sentFrom: "thic@student.com",
      sentTo: "thaingo1202@student.com",
      content:
          "Email has existed in some form since the 1970s, when programmer Ray Tomlinson created a way to transmit messages between computer systems on the Advanced Research Projects Agency Network (ARPANET). Modern forms of email became available for widespread public use with the development of email client software (e.g. Outlook) and web browsers, the latter of which enables users to send and receive messages over the Internet using web-based email clients (e.g. Gmail). Email has existed in some form since the 1970s, when programmer Ray Tomlinson created a way to transmit messages between computer systems on the Advanced Research Projects Agency Network (ARPANET). Modern forms of email became available for widespread public use with the development of email client software (e.g. Outlook) and web browsers, the latter of which enables users to send and receive messages over the Internet using web-based email clients (e.g. Gmail). Email has existed in some form since the 1970s, when programmer Ray Tomlinson created a way to transmit messages between computer systems on the Advanced Research Projects Agency Network (ARPANET). Modern forms of email became available for widespread public use with the development of email client software (e.g. Outlook) and web browsers, the latter of which enables users to send and receive messages over the Internet using web-based email clients (e.g. Gmail).",
      subject: "Nghi hoc",
      status: "false", // deleted
      at: DateTime(2022, 10, 20, 19, 10),
    ),
    Email(
      sentFrom: "thic@student.com",
      sentTo: "thaiB1910295@student.com",
      content: "Test",
      subject: "Nghi hoc",
      status: "true",
      at: DateTime(2022, 10, 20, 19, 10),
    ),
    Email(
      sentFrom: "thaingo1202@student.com",
      sentTo: "mystericuser@student.com",
      content: "Test",
      subject: "Nghi hoc",
      status: "true",
      at: DateTime(2022, 10, 20, 19, 10),
    ),
    Email(
      sentFrom: "thaiB1910295@student.ctu.edu.vn",
      sentTo: "example@atlan.com",
      content: "Kiem tra chuc nang gui mail",
      subject:
          "Chuc nang nay hoat dong tuong doi tot, tuy nhien can cai thien them.",
      status: "true",
      at: DateTime(2022, 10, 20, 19, 10),
    ),
    Email(
      sentFrom: "thaiB1910295@student.ctu.edu.vn",
      sentTo: "thaingo1202@student.com",
      content: "CT48402 - Báo cáo",
      subject:
          "Báo cáo đồ án học phần CT48402 - Phát triển ứng dụng di động.",
      status: "true",
      at: DateTime(2022, 11, 16, 11, 44),
    ),
  ];
  int get emailCount {
    return _emails.length;
  }

  List get emails {
    return [..._emails];
  }

  // get a list of inbox emails
  List inboxEmails(String userEmail) {
    List L = [];
    for (var i = 0; i < _emails.length; i++) {
      if (_emails[i].sentTo == userEmail && _emails[i].status == "true") {
        L.add(i);
      }
    }
    notifyListeners();
    return L;
  }

  Email findById(String id) {
    return _emails.firstWhere((element) => element.id == id);
  }

  // get a list of sent emails by emailAddr
  List getSentEmails(String emailAddr) {
    List L = [];
    for (var index = 0; index < _emails.length; index++) {
      if (_emails[index].sentFrom == emailAddr &&
          _emails[index].status == "true") {
        L.add(index);
      }
    }

    return L;
  }

  // insert to the end of list a new email
  void addEmails(Email newEmail) {
    _emails.add(newEmail);
    notifyListeners();
  }

  // move email at index to trash (true -> false)
  // and restore from the bin (false -> true)
  void moveToTrash(index) {
    _emails[index].status == "true"
        ? _emails[index].status = "false"
        : _emails[index].status = "true";
    notifyListeners();
  }

  // Delete permanently the email at index position
  void deleteEmail(int index) {
    _emails.removeAt(index);
    notifyListeners();
  }

  // get a list of moved-to-trash emails
  List getDeletedEmails(mailaddr) {
    List L = [];
    for (var index = 0; index < _emails.length; index++) {
      if (_emails[index].status == "false" &&
          (_emails[index].sentFrom == mailaddr ||
              _emails[index].sentTo == mailaddr)) {
        L.add(index);
      }
    }
    return L;
  }

  // standardise an email before searching
  String standardise(index) {
    // by concatenate all data fields into a single string
    String formattedString = _emails[index].sentFrom +
        _emails[index].sentTo +
        _emails[index].subject +
        _emails[index].content + 
        _emails[index].at.toString();

    // then convert it to lowercase and remove all white spaces;
    return formattedString.toLowerCase().replaceAll(' ', '');
  }

  // search all emails of "thisUser" with search "query":
  List search(thisUser, query) {
    // format the search query and inititalise array named results;
    final formattedQuery = query.toString().toLowerCase().replaceAll(' ', '');
    var results = [];

    // iteration
    for (var i = 0; i < _emails.length; i++) {
      if (standardise(i).contains(formattedQuery) &&
          (_emails[i].sentFrom == thisUser || _emails[i].sentTo == thisUser)) {
        results.add(i);
      }
    }
    return results;
  }
}
