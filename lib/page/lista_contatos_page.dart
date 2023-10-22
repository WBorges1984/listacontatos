import 'package:flutter/material.dart';

class Contact {
  String photo;
  String name;
  String email;

  Contact({
    required this.photo,
    required this.name,
    required this.email,
  });
}

class ListaContatosPage extends StatefulWidget {
  const ListaContatosPage({super.key});

  @override
  State<ListaContatosPage> createState() => _ListaContatosPageState();
}

class _ListaContatosPageState extends State<ListaContatosPage> {
  List<Contact> contacts = [
    Contact(
      photo:
          'https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png',
      name: 'John Doe',
      email: 'john.doe@example.com',
    ),
    Contact(
      photo:
          'https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png',
      name: 'John Doe',
      email: 'john.doe@example.com',
    ),
    Contact(
      photo:
          'https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png',
      name: 'John Doe',
      email: 'john.doe@example.com',
    ),
    Contact(
      photo:
          'https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png',
      name: 'John Doe',
      email: 'john.doe@example.com',
    ),
    Contact(
      photo:
          'https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png',
      name: 'John Doe',
      email: 'john.doe@example.com',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Lista de Contatos",
          style: TextStyle(fontSize: 23),
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                Contact contact = contacts[index];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(contact.photo),
                  ),
                  title: Text(contact.name),
                  subtitle: Text(contact.email),
                  trailing: const Icon(Icons.email),
                );
              }),
        )
      ],
    ));
  }
}
