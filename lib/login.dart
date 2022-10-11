import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/logo.png"),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 30),
                  child: Text(
                    "Atlanteans",
                    style: TextStyle(
                        color: Color.fromARGB(255, 18, 130, 222),
                        fontSize: 20,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "One step ahead\nto start your workplace",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: myController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.people),
                      labelText: "Username",
                      hintText: "Enter your username"),
                ),
                TextFormField(
                  obscureText: true,
                  obscuringCharacter: '•',
                  decoration: const InputDecoration(
                      icon: Icon(Icons.email_outlined),
                      labelText: "Password",
                      hintText: "Enter your password"),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog(context: context, builder: (context){
                          return AlertDialog(content: Text(myController.text),);
                        });
                      },
                      child: Container(
                        width: 200,
                        child: const Icon(Icons.check),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "Create one!",
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Text("OR"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/google.png"),
                        backgroundColor: Color.fromARGB(255, 239, 235, 235),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/facebook.png"),
                        backgroundColor: Color.fromARGB(255, 239, 235, 235),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/microsoft.png"),
                        backgroundColor: Color.fromARGB(255, 239, 235, 235),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
