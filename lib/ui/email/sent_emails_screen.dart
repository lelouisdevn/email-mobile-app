import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/email.dart';
import '../../models/user.dart';
import 'email_composition.dart';
import 'email_detail_screen.dart';
import 'email_item_card.dart';
import 'email_manager.dart';
import '../../shared/app_drawer.dart';

class SentEmails extends StatefulWidget {
  const SentEmails({super.key});

  static const routeName = "/sent-emails";

  @override
  State<SentEmails> createState() => _SentEmailsState();
}

class _SentEmailsState extends State<SentEmails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("Sent"),
        leading: Builder(
          builder: (context) => // Ensure Scaffold is in context
              IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              var newEmail =
                  Email(sentFrom: "", sentTo: "", content: "", subject: "");
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EmailComposition(newEmail),
              ));
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: buildListView(),
    );
  }

  Widget buildListView() {
    final emails = context.read<EmailManager>();
    return ListView.builder(
      itemCount: emails.emailCount,
      itemBuilder: (context, index) {
        return buildDissmissible(index);
      },
    );
  }

  Widget buildDissmissible(index) {
    final emails = context.read<EmailManager>();
    final user = context.read<User>();
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => EmailDetailScreen(emails.emails[index]),
          ),
        );
      },
      child: Dismissible(
        background: Container(
          padding: const EdgeInsets.only(right: 20),
          color: Colors.red,
          alignment: Alignment.centerRight,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 30,
          ),
        ),
        direction: DismissDirection.endToStart,
        key: ValueKey(emails.emails[index]),
        confirmDismiss: ((direction) {
          return showComfirmDialogue(context, 'Remove this email?');
        }),
        // child: EmailItemCard(emails.emails[index]),
        child: emails.getSentEmails(user.mailAddr, index) == 1
            ? EmailItemCard(emails.emails[index])
            : Container(),
      ),
    );
  }

  Future<bool?> showComfirmDialogue(BuildContext context, String message) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(
          'Are you sure?',
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
