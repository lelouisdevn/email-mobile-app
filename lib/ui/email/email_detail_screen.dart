import 'package:flutter/material.dart';

import '../../models/email.dart';

class EmailDetailScreen extends StatelessWidget {
  static const routeName = '/email-details';
  final Email email;
  const EmailDetailScreen(this.email, {super.key});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Text(email.content),
    // );
    return Scaffold(
      appBar: AppBar(title: Text(email.subject),),
    );
  }
}
