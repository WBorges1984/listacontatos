import 'package:flutter/material.dart';
import 'package:listacontatos/page/cadastros_page.dart';
import 'package:listacontatos/page/lista_contatos_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
            AppBar(title: const Center(child: Text("App Lista de Contatos"))),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: const [
                  ListaContatosPage(),
                  CadastrosPage(),
                ],
              ),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "Lista", icon: Icon(Icons.list_outlined)),
                  BottomNavigationBarItem(
                      label: "Cadastro", icon: Icon(Icons.add)),
                ])
          ],
        ),
      ),
    );
  }
}
