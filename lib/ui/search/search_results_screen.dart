import 'package:atlanteans_email/models/email.dart';
import 'package:atlanteans_email/ui/email/email_item_card.dart';
import 'package:atlanteans_email/ui/email/email_manager.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../email/email_detail_screen.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen(this.thisUser, this.query, {super.key});
  final String thisUser;
  final String query;

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Query: ${widget.query}"),
      ),
      body: buildListView(context),
    );
  }

  Widget buildListView(BuildContext context) {
    final emails = context.read<EmailManager>();

    // List L is the list of indices of 
    // every mails we searched as indices in the _emails list.
    List L = emails.search(widget.thisUser, widget.query);
    return ListView.builder(
      itemCount: L.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                // pass the index of searched email to this screen
                builder: (ctx) => EmailDetailScreen(L[index]),
              ),
            );
          },
          // if L[index] is an index of searched email
          // then pass an "EMAIL" to this with emails.emails[   L[index]   ]
          child: EmailItemCard(emails.emails[L[index]]),
        );
      },
    );
  }
}
