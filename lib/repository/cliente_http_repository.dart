import 'dart:convert';

import 'package:http/http.dart' as http;

class ClienteHttpRepository {
  final headers = {
    'X-Parse-Application-Id': 'CUFhPmH7Yde4JRo81d9VctgODOMWVsK8D6raKfrc',
    'X-Parse-REST-API-Key': 'Lbrf90Dw4fZubXEsqI9fSIPNTCAGdK4FwdzGRpDF',
    'Content-Type': 'application/json',
  };

  Future<Map> ListarClientes() async {
    var url = Uri.parse("https://parseapi.back4app.com/classes/listaContatos");
    http.Response response = await http.get(url, headers: headers);

    return json.decode(response.body);
  }
}
