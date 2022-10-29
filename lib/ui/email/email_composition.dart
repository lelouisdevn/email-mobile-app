import 'package:flutter/material.dart';
import 'dart:math' as math;

class EmailComposition extends StatelessWidget {
  const EmailComposition(this.emailAddr, {super.key});
  final String emailAddr;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compose"),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: buildEmailCompositionScreen(context),
    );
  }

  Widget buildEmailCompositionScreen(BuildContext context) {
    final userAvatar = emailAddr.substring(0, 1).toUpperCase();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CircleAvatar(
                backgroundColor:
                    Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1.0),
                child: Text(
                  userAvatar,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      color: Colors.white),
                ),
            ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * (80 / 100),
                  child: TextFormField(
                    initialValue: emailAddr,
                    decoration: const InputDecoration(
                        // icon: Icon(Icons.password),
                        labelText: "Send to:",
                        prefixText: "To: ",
                        
                        hintText: "Enter outgoing email address"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * (80 / 100),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Subject:",
                        // prefixText: "To: ",
                        hintText: "Enter email subject"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * (80 / 100),
                  child: const TextField(
                    maxLines: 10,
                    decoration: InputDecoration(
                      labelText: "Message",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
