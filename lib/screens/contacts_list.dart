import 'package:bytebank2/screens/contact._form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => const ContactForm(),
                ),
              )
              .then(
                (newContact) => debugPrint(newContact.toString()),
              );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.people),
              title: Text(
                'Jhois',
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                '1000',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
