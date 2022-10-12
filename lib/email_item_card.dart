import 'package:flutter/material.dart';
import 'package:atlanteans_email/email.dart';

class EmailItemCard extends StatefulWidget {
  final Email email;
  const EmailItemCard(this.email, {super.key});

  @override
  State<EmailItemCard> createState() => _EmailItemCardState();
}

class _EmailItemCardState extends State<EmailItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: Colors.grey.shade200,
        leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.png')),
        title: Text(widget.email.subject),
        subtitle: Text(
          widget.email.content,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.remove_circle_outline),
        ),
      ),
    );
  }
}
