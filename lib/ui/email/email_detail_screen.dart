import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/email.dart';
import 'dart:math' as math;
import '../../models/user.dart';

class EmailDetailScreen extends StatelessWidget {
  static const routeName = '/email-details';
  final Email email;
  const EmailDetailScreen(this.email, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(email.subject),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.reply),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTitle(context),
                buildEmailContentPart(context),
                Divider(),
                buildFooter(context),
              ],
            ),
          ),
        ),

    );
  }

  Widget buildTitle(BuildContext context) {
    final user = context.read<User>();
    final userAvatar = email.sentFrom.substring(0, 1).toUpperCase();
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor:
                  Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
              child: Text(
                userAvatar,
                style: const TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 22, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 40,
                child: Stack(
                  children: [
                    Text(
                      "From: ${email.sentFrom}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 17),
                      child: GestureDetector(
                        onTap: () {
                          // print("go to copose mail");
                          Navigator.of(context).pushNamed("/all-emails");
                        },
                        child: Text(
                          "To: ${user.mailAddr}",
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEmailContentPart(BuildContext context) {
    return Column(
      children: [
        // subject
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Subject: ${email.subject}",
                  style: const TextStyle(fontSize: 17),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
        // content
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  email.content,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildFooter(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              // child: Text("Privacy Statement", style: TextStyle(decorationStyle: underline),),
              child: Text(
                'Privacy Statement',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 15),
              child: Text("Atlanteans"),
            ),
          ],
        ),
      ),
    );
  }
}
