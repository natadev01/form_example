import 'package:flutter/material.dart';
import 'package:form_example/shared/custom_scaffold.dart';

class SecondForm extends StatelessWidget {
  const SecondForm({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Formulario 2',
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Este es el formulario 2'),
          ],
        ),
      ),
    );
  }
}
