import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              children: [
                Text(
                  "DashBoard",
                  style: TextStyle(fontSize: 25),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 8,
                    child: Row(children: [
                      Icon(Icons.add),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text("Contatos Cadastrados: 50"),
                      )
                    ]),
                  ),
                ),
              ],
            )));
  }
}
