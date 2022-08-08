import 'package:bytebank2/screens/contact._form.dart';
import 'package:bytebank2/screens/contacts_list.dart';
import 'package:bytebank2/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Bytebank2App());
}

class Bytebank2App extends StatelessWidget {
  const Bytebank2App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Dashboard(),
    );
  }
}
