import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listacontatos/model/cliente_model.dart';
import 'package:listacontatos/repository/cliente_http_repository.dart';
import 'package:listacontatos/repository/cliente_repository.dart';
import 'package:listacontatos/shared/widgets/text_label.dart';

class CadastrosPage extends StatefulWidget {
  const CadastrosPage({super.key});

  @override
  State<CadastrosPage> createState() => _CadastrosPageState();
}

class _CadastrosPageState extends State<CadastrosPage> {
  TextEditingController nomeController = TextEditingController(text: "");
  TextEditingController birthController = TextEditingController(text: "");
  TextEditingController lastNameController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");
  TextEditingController mailController = TextEditingController(text: "");
  final imagePicket = ImagePicker();
  File? imageFile;
  ClienteModel clienteModel = ClienteModel();
  ClienteRepository clienteRepository = ClienteRepository();
  ClienteHttpRepository clienteHttp = ClienteHttpRepository();

  pick(ImageSource source) async {
    final pickedFile = await imagePicket.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              CircleAvatar(
                  backgroundImage:
                      imageFile != null ? FileImage(imageFile!) : null,
                  radius: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                          onPressed: () {
                            pick(ImageSource.camera);
                          },
                          icon: const Icon(Icons.edit),
                          label: const TextLabel(texto: "")),
                    ],
                  )),
              const TextLabel(texto: "Nome"),
              TextField(
                controller: nomeController,
              ),
              const TextLabel(texto: "Sobrenome"),
              TextField(
                controller: lastNameController,
              ),
              const TextLabel(texto: "Data Nascimento"),
              TextField(
                keyboardType: TextInputType.datetime,
                controller: birthController,
              ),
              const TextLabel(texto: "Telefone"),
              TextField(
                keyboardType: TextInputType.phone,
                controller: phoneController,
              ),
              const TextLabel(texto: "Email"),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: mailController,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    var cli = await clienteHttp.ListarClientes().then((item) {
                      print(item);
                    });
                  },
                  child: const Text("Salvar"))
            ],
          ),
        ),
      ),
    ));
  }
}
