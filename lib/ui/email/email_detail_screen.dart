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
    final user = context.read<User>();
    final userAvatar = email.sentFrom.substring(0, 1).toUpperCase();
    // return Container(
    //   child: Text(email.content),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(email.subject),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.delete))
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    // backgroundImage: AssetImage('assets/images/logo.png'),
                    backgroundColor:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                    child: Text(
                      userAvatar,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                          color: Colors.white),
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
                            // top: 15,
                            padding: const EdgeInsets.only(top: 17),
                            child: Text(
                              "To: ${user.mailAddr}",
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(Icons.delete),
                  // )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
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
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        email.content,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
