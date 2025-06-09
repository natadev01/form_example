import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const CustomScaffold({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menú de Navegación', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              title: Text('Inicio'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              title: Text('Formulario 1'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/form1');
              },
            ),
            ListTile(
              title: Text('Formulario 2'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/form2');
              },
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
