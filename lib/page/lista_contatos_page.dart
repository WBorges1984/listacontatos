import 'package:flutter/material.dart';
import 'package:listacontatos/model/contatos_model.dart';

import '../model/cliente_model.dart';
import '../repository/cliente_http_repository.dart';
import '../repository/cliente_repository.dart';

class ListaContatosPage extends StatefulWidget {
  const ListaContatosPage({super.key});

  @override
  State<ListaContatosPage> createState() => _ListaContatosPageState();
}

class _ListaContatosPageState extends State<ListaContatosPage> {
  ClienteModel clienteModel = ClienteModel();
  ClienteRepository clienteRepository = ClienteRepository();
  ClienteHttpRepository clienteHttp = ClienteHttpRepository();

   List<ContatosHttpModel> contacts = [
    Contact(
      photo: AppImages.avatar2,
      name: 'John Doe',
      email: 'john.doe@example.com',
    ),
    Contact(
      photo: AppImages.avatar,
      name: 'John Doe',
      email: 'john.doe@example.com',
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregaContatos();
  }

  carregaContatos() async {
    var contatos = await clienteHttp.ListarClientes();
  }

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
          child: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              Contact contact = contacts[index];

              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: Image.asset(
                        contact.photo,
                        height: 50,
                        fit: BoxFit.cover,
                      ).image,
                      radius: 80,
                    ),
                    title: Text(contact.name),
                    subtitle: Text(contact.email),
                    trailing: const Icon(Icons.email),
                  ),
                ],
              );
            },
          ),
        )
      ],
    ));
  }
}
