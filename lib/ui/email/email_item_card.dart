import 'package:flutter/material.dart';
import '../../models/email.dart';
import 'dart:math' as math;

class EmailItemCard extends StatefulWidget {
  final Email email;
  const EmailItemCard(this.email, {super.key});

  @override
  State<EmailItemCard> createState() => _EmailItemCardState();
}

class _EmailItemCardState extends State<EmailItemCard> {
  @override
  Widget build(BuildContext context) {
    final userAvatar = widget.email.sentFrom.substring(0, 1).toUpperCase();
    return Card(
      child: ListTile(
        tileColor: Colors.grey.shade200,
        leading: CircleAvatar(
          // backgroundImage: AssetImage('assets/images/logo.png'),
          backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
          child: Text(
            userAvatar,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 22, color: Colors.white),
            
          ),
        ),
        title: Text(
          widget.email.subject,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
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
