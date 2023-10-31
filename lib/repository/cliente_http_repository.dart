import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:listacontatos/model/contatos_model.dart';

class ClienteHttpRepository {
  final headers = {
    'X-Parse-Application-Id': 'CUFhPmH7Yde4JRo81d9VctgODOMWVsK8D6raKfrc',
    'X-Parse-REST-API-Key': 'Lbrf90Dw4fZubXEsqI9fSIPNTCAGdK4FwdzGRpDF',
    'Content-Type': 'application/json',
  };

  Future<List<Contact>> ListarClientes() async {
    var url = Uri.parse("https://parseapi.back4app.com/classes/listaContatos");
    http.Response response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final contato = json.decode(response.body);
      print(contato);
      return contato;
    } else {
      throw Exception('Falha ao buscar clientes');
    }

    //return json.decode(response.body);
  }
}
