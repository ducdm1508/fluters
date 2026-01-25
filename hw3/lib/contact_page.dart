import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;

  Contact({required this.name, required this.phone});
}

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  final List<Contact> contacts = [
    Contact(name: "Nguyen Van A", phone: "0312345678"),
    Contact(name: "Nguyen Van B", phone: "0312345678"),
    Contact(name: "Nguyen Van C", phone: "0312345678"),
    Contact(name: "Nguyen Van D", phone: "0312345678"),
  ];

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final filteredContacts = contacts.where((contact) {
      final searchValue = searchController.text.toLowerCase();
      return contact.name.toLowerCase().contains(searchValue) ||
          contact.phone.contains(searchController.text);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.phone, color: Colors.red, size: 30),
            SizedBox(width: 8),
            Text("Danh bạ điện thoại"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.search),
                const SizedBox(width: 8),
                const Text("Tìm kiếm:"),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      isDense: true,
                      enabledBorder: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: filteredContacts.length,
                itemBuilder: (context, index) {
                  final c = filteredContacts[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(c.name),
                    subtitle: Text(c.phone),
                    trailing: const Icon(Icons.call),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}