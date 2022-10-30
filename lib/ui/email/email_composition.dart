import 'package:atlanteans_email/ui/email/email_manager.dart';
import 'package:atlanteans_email/ui/user/userManager.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

import '../../models/email.dart';
import '../../models/user.dart';

class EmailComposition extends StatefulWidget {
  const EmailComposition({super.key});
  // final String emailAddr;

  static const routeName = "/email-composition";

  @override
  State<EmailComposition> createState() => _EmailCompositionState();
}

class _EmailCompositionState extends State<EmailComposition> {
  final toController = TextEditingController();
  final subjectController = TextEditingController();
  final contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailManager = context.watch<EmailManager>();

    final user = context.read<User>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compose"),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              
                var email = Email(content: "", sentFrom: "", sentTo: "", subject: "");
                // email.sentTo = toController.text;
                // email.sentFrom = user.mailAddr;
                email.sentFrom = toController.text;
                email.sentTo = user.mailAddr;
                email.subject = subjectController.text;
                email.content = contentController.text;
                print (email.content);

                emailManager.addEmails(email);
                Navigator.of(context).pushReplacementNamed("/all-emails");
                
                
              
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: buildEmailCompositionScreen(context),
    );
  }

  Widget buildEmailCompositionScreen(BuildContext context) {
    // final userAvatar = widget.emailAddr.substring(0, 1).toUpperCase();
    var userAvatar = "T";
    // userAvatar = (toController.text).substring(0, 1).toUpperCase();
    
    // setState(() {
    //   userAvatar = (toController.text).substring(0, 1).toUpperCase();
    // });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CircleAvatar(
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
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * (80 / 100),
                  child: TextFormField(
                    controller: toController,
                    // initialValue: widget.emailAddr,
                    // initialValue: toController.text,
                    decoration: const InputDecoration(
                        // icon: Icon(Icons.password),
                        labelText: "Send to:",
                        prefixText: "To: ",
                        
                        hintText: "Enter outgoing email address",),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * (80 / 100),
                  child: TextFormField(
                    controller: subjectController,
                    decoration: const InputDecoration(
                        labelText: "Subject:",
                        // prefixText: "To: ",
                        hintText: "Enter email subject"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * (80 / 100),
                  child: TextField(
                    maxLines: 10,
                    controller: contentController,
                    decoration: const InputDecoration(
                      labelText: "Message",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
