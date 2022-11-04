import 'package:atlanteans_email/ui/email/email_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../email/email_detail_screen.dart';
import '../email/email_item_card.dart';
import 'search_results_screen.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter"),
      ),
      body: buildSearchBody(context),
    );
  }

  Widget buildSearchBody(BuildContext context) {
    final searchController = TextEditingController();
    // final emailManager = context.watch<EmailManager>();
    final user = context.read<User>();
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * (75 / 100),
                height: 40,
                child: TextFormField(
                  autofocus: true,
                  controller: searchController,
                  decoration: InputDecoration(
                    label: Text("Search query"),
                    contentPadding: const EdgeInsets.all(5),
                    border: OutlineInputBorder(
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * (20 / 100),
                child: IconButton(
                  onPressed: () {
                    var query = searchController.text;

                    if (query.isNotEmpty) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchResultsScreen(user.mailAddr, query),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentMaterialBanner()
                        ..showMaterialBanner(
                          MaterialBanner(
                            backgroundColor: Colors.yellow,
                            leading: const Icon(Icons.info_outline),
                            content: const Text(
                                "The search engine needs your words to process!"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentMaterialBanner();
                                },
                                child: const Text("Close"),
                              ),
                            ],
                          ),
                        );
                    }
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          Wrap(
            alignment: WrapAlignment.start,
            children: const [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Chip(
                  label: Text("Subject"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Chip(
                  label: Text("Sender"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Chip(
                  label: Text("Currently"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Chip(
                  label: Text("Starred"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Chip(
                  label: Text("Important"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Chip(
                  label: Text("Attachment"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Chip(
                  label: Text("Contact"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Chip(
                  label: Text("Unread"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
