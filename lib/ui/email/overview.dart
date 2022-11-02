import 'package:atlanteans_email/models/user.dart';
import 'package:atlanteans_email/ui/email/email_composition.dart';
import 'package:provider/provider.dart';

import '../../models/email.dart';
import '../../shared/app_drawer.dart';
import '../email/email_item_card.dart';
import 'package:flutter/material.dart';
import 'email_detail_screen.dart';
import 'email_manager.dart';

//emails screen
class EmailItem extends StatefulWidget {
  const EmailItem({super.key});

  static const routeName = '/all-emails';

  @override
  State<EmailItem> createState() => _EmailItemState();
}

class _EmailItemState extends State<EmailItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Builder(
          builder: (context) => // Ensure Scaffold is in context
              IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text("Inbox"),
        actions: [
          IconButton(
            onPressed: () {
              var newEmail = Email(
                  sentFrom: "",
                  sentTo: "",
                  content: "",
                  subject: "",
                  status: "false");
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

  Widget buildDissmissible(index) {
    final emails = context.read<EmailManager>();
    final user = context.read<User>();
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => EmailDetailScreen(index),
        ));
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
          child: emails.getInboxEmails(user.mailAddr, index) == 1
              ? EmailItemCard(emails.emails[index])
              : Container()
          // EmailItemCard(emails.getEmails("1910295", index)),

          ),
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

  Future<bool?> showComfirmDialogue(
      BuildContext context, String message, int index) {
    final emails = context.read<EmailManager>();
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        // title: const Text('Move to trash?'),
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
              child: const Text('Delete permanently')),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Move to trash'),
          ),
          TextButton(
            onPressed: () {
              // Navigator.of(context).pop(true);
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
