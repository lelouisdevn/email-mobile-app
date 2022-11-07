import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/email.dart';
import '../../models/user.dart';
import '../search/search_emails.dart';
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
              var newEmail = Email(
                sentFrom: "",
                sentTo: "",
                content: "",
                subject: "",
                status: "false",
                at: DateTime.now(),
              );
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EmailComposition(newEmail),
              ));
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Search()));
            },
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
    final user = context.read<User>();
    List L = emails.getSentEmails(user.mailAddr);
    return ListView.builder(
      itemCount: L.length,
      itemBuilder: (context, index) {
        return buildDissmissible(L[index]);
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
            builder: (ctx) => EmailDetailScreen(index),
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
        onDismissed: (direction) {
          emails.moveToTrash(index);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text(
                  "Moved to trash",
                  textAlign: TextAlign.center,
                ),
              ),
            );
        },
        direction: DismissDirection.endToStart,
        key: ValueKey(emails.emails[index]),
        confirmDismiss: ((direction) {
          return showComfirmDialogue(context, 'Move to trash?', index);
        }),
        // child: EmailItemCard(emails.emails[index]),
        // child: emails.getSentEmails(user.mailAddr, index) == 1
        //     ? EmailItemCard(emails.emails[index])
        //     : Container(),
        child: EmailItemCard(emails.emails[index]),
      ),
    );
  }

  Future<bool?> showComfirmDialogue(
      BuildContext context, String message, int index) {
    final emails = context.read<EmailManager>();
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
              emails.deleteEmail(index);

              Navigator.of(context).pushReplacementNamed("/all-emails");
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Deleted",
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
            },
            child: const Text(
              "Delete permanently",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Move to trash'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
