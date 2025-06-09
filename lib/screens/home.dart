import 'package:flutter/material.dart';
import 'package:form_example/shared/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Inicio',
      body: Center(child: Text('Bienvenido a la app de formularios')),
    );
  }
}
