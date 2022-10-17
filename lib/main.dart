import 'package:flutter/material.dart';
import 'ui/email/overview.dart';
import 'ui/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // MultiProvider(
    //   providers: [Provider(create: (context) => UserManager())],
    //   child: const MyApp(),
    // ),
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atlanteans',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        EmailItem.routeName: (context) => const EmailItem(),
      },
    );
  }
}
