import 'package:atlanteans_email/ui/email/deleted/deleted_emails.dart';
import 'package:atlanteans_email/ui/email/email_manager.dart';
import 'package:atlanteans_email/ui/email/sent_emails_screen.dart';
import 'package:atlanteans_email/ui/user/userManager.dart';
import 'package:flutter/material.dart';
import 'models/user.dart';
import 'ui/auth/login.dart';
import 'ui/email/overview.dart';
import 'package:provider/provider.dart';

import 'ui/search/search_emails.dart';

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
        ChangeNotifierProvider(
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
          SentEmails.routeName: (context) => const SentEmails(),
          DeletedEmails.routeName: (context) => const DeletedEmails(),
          Search.routeName: (context) => const Search(),
        },
        // onGenerateRoute: (settings) {
        //   if (settings.name == EmailComposition.routeName) {
        //     // final emailId = settings.arguments as String;
        //     return MaterialPageRoute(
        //       builder: (context) {
        //         return EmailComposition(
        //           "",
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
