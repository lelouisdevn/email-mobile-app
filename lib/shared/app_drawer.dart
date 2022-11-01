import 'package:atlanteans_email/models/email.dart';
import 'package:atlanteans_email/ui/email/sent_emails_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../ui/email/deleted/deleted_emails.dart';
import '../ui/email/email_composition.dart';
import '../ui/search.dart/search_emails.dart';
// import '../ui/user/userManager.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<User>();
    return Drawer(
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.blue,
            title: const Text("Activities"),
            leading: const FittedBox(
              fit: BoxFit.scaleDown,
              child: Icon(Icons.settings),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();
                  },
                  icon: const Icon(Icons.close))
            ],
          ),
          ListTile(
            leading: const Icon(
              Icons.inbox,
              size: 32.0,
            ),
            title: const Text(
              "Inbox",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/all-emails");
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.send,
              size: 32.0,
            ),
            title: const Text(
              "Sent",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SentEmails(),
              ));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.edit,
              size: 32.0,
            ),
            title: const Text(
              "Compose",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              var newEmail = Email(
                sentFrom: "",
                sentTo: "",
                content: "",
                subject: "",
                status: "false",
              );
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EmailComposition(newEmail),
              ));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.search_outlined,
              size: 32.0,
            ),
            title: const Text(
              "Filter",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Search(),
              ));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.auto_delete_outlined,
              size: 32.0,
            ),
            title: const Text(
              "Trash bin",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DeletedEmails(),
              ));
            },
          ),
          const Divider(),
          ListTile(
              leading: const Icon(
                Icons.logout,
                size: 32.0,
              ),
              title: Text(user.mailAddr, style: const TextStyle(fontSize: 16)),
              subtitle: const Text("Log out"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/");
              }),
        ],
      ),
    );
  }
}
