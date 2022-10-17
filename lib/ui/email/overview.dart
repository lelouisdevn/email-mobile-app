import '../../shared/app_drawer.dart';
import '../email/email_item_card.dart';
import 'package:flutter/material.dart';
// import 'package:atlanteans_email/email.dart';
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
      body: buildListView(),
    );
  }

  Widget buildDissmissible(index) {
    return Dismissible(
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
      child: EmailItemCard(emails.emails[index]),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: emails.emailCount,
      itemBuilder: (context, index) {
        return buildDissmissible(index);
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
