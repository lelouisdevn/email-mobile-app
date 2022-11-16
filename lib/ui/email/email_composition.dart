import 'package:atlanteans_email/ui/email/email_manager.dart';
import 'package:atlanteans_email/ui/user/userManager.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

import '../../models/email.dart';
import '../../models/user.dart';

class EmailComposition extends StatefulWidget {
  const EmailComposition(this.email, {super.key});
  final Email email;

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
            icon: const Icon(Icons.send),
            onPressed: () {
              var email = Email(
                content: "",
                sentFrom: "",
                sentTo: "",
                subject: "",
                status: "true",
                at: DateTime.now(),
              );
              email.sentTo = toController.text;
              email.sentFrom = user.mailAddr;
              email.subject = subjectController.text;
              email.content = contentController.text;
              print(email.sentFrom);

              emailManager.addEmails(email);
              Navigator.of(context).pushReplacementNamed("/sent-emails");
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: buildEmailCompositionScreen(context),
    );
  }

  Widget buildEmailCompositionScreen(BuildContext context) {
    // display the user avatar
    var userAvatar = "T";

    // if user forwards an email in "sent emails", it'll forward with the receiver mail addr
    // else it'll foward with the sender mail addr.
    final userEmailAddress = context.read<User>();
    if (widget.email.sentFrom.isNotEmpty) {
      if (userEmailAddress.mailAddr == widget.email.sentFrom) {
        toController.text = widget.email.sentTo;
      } else {
        toController.text = widget.email.sentFrom;
      }
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: CircleAvatar(
                        backgroundColor: Color(
                                (math.Random().nextDouble() * 0xFFFFFF).toInt())
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
                          decoration: const InputDecoration(
                            labelText: "Send to:",
                            prefixText: "To: ",
                            hintText: "Enter outgoing email address",
                          ),
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
                          maxLines: 25,
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
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        avatar: Icon(Icons.attach_file),
                        label: Text("Attachment"),
                        backgroundColor: Colors.white,
                      ),
                      Chip(
                        avatar: Icon(Icons.save_alt_outlined),
                        label: Text("Save as draft"),
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
