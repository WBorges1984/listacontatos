import 'package:dio/dio.dart';
import 'package:listacontatos/model/cliente_model.dart';

class ClienteRepository {
  Future<List<ClienteModel>> buscarClientes() async {
    final dio = Dio();
    final options = Options(
      headers: {
        'X-Parse-Application-Id': 'CUFhPmH7Yde4JRo81d9VctgODOMWVsK8D6raKfrc',
        'X-Parse-REST-API-Key': 'Lbrf90Dw4fZubXEsqI9fSIPNTCAGdK4FwdzGRpDF',
        'Content-Type': 'application/json'
      },
    );

    final response = await dio.get(
        'https://parseapi.back4app.com/classes/listaContatos',
        options: options);
    //print(response);

    if (response.statusCode == 200) {
      final List<ClienteModel> clientes = [];

      for (final json in response.data['results']) {
        clientes.add(ClienteModel.fromJson(json));
      }

      return clientes;
    } else {
      throw Exception('Falha ao buscar clientes');
    }
  }
}
