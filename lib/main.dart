import 'dart:ffi';

import 'package:atlanteans_email/ui/email/email_detail_screen.dart';
import 'package:atlanteans_email/ui/email/email_manager.dart';
import 'package:atlanteans_email/ui/user/userManager.dart';
import 'package:flutter/material.dart';
import 'models/user.dart';
import 'ui/email/overview.dart';
import 'ui/login.dart';
import 'package:provider/provider.dart';
import 'screen.dart';
// import 'models/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => UserManager(),
        ),
        // Create a "new" user with null value;
        Provider(
          create: (context) => User(mailAddr: "", password: "", userID: ""),
        ),
        Provider(
          create: (context) => EmailManager(),
        ),
      ],
      child: MaterialApp(
        title: 'Atlanteans',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
        routes: {
          EmailItem.routeName: (context) => const EmailItem(),
          // EmailDetailScreen.routeName: (context) => const EmailDetailScreen(email)
        },
        // onGenerateRoute: (settings) {
        //   if (settings.name == EmailDetailScreen.routeName) {
        //     final emailId = settings.arguments as String;
        //     return MaterialPageRoute(
        //       builder: (context) {
        //         return EmailDetailScreen(
        //           EmailManager().findById(emailId),
        //         );
        //       },
        //     );
        //   }
        //   return null;
        // },
        
      ),
    );
  }
}
