import 'package:bytebank2/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Bytebank2App());
  // save(
  //   Transaction(
  //     200,
  //     Contact(0, 'Gui', 2000),
  //   ),
  // ).then(
  //   (transaction) {
  //     print(transaction);
  //   },
  // );
  // findAll().then((transactions) => print('new transaction $transactions'));
  // save(Contact(1, 'Jhois', 1000));
}

class Bytebank2App extends StatelessWidget {
  const Bytebank2App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
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
