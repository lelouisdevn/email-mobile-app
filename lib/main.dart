import 'package:atlanteans_email/email_manager.dart';
import 'package:atlanteans_email/overview.dart';
import 'package:flutter/material.dart';
import './login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Atlanteans',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
        routes: {
          EmailItem.routeName: (context) => const EmailItem(),
        },
    );
  }
}
