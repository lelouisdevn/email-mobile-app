import 'package:atlanteans_email/models/user.dart';
import 'package:provider/provider.dart';

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
  final emails = EmailManager();

  @override
  Widget build(BuildContext context) {
    final user = context.read<User>();
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
            onPressed: () {},
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
      body: buildListView(user.userID),
    );
  }

  Widget buildDissmissible(userID, index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => EmailDetailScreen(emails.emails[index]),
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
          direction: DismissDirection.endToStart,
          key: ValueKey(emails.emails[index]),
          confirmDismiss: ((direction) {
            return showComfirmDialogue(context, 'Remove this email?');
          }),
          // child: EmailItemCard(emails.emails[index]),
          child: emails.getEmails(userID, index) == 1
              ? EmailItemCard(emails.emails[index])
              : Container()
          // EmailItemCard(emails.getEmails("1910295", index)),

          ),
    );
  }

  Widget buildListView(userID) {
    return ListView.builder(
      itemCount: emails.emailCount,
      itemBuilder: (context, index) {
        return buildDissmissible(userID, index);
      },
    );
  }

  Future<bool?> showComfirmDialogue(BuildContext context, String message) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Are you sure?'),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('No')),
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
