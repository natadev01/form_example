import 'package:flutter/material.dart';
import 'package:form_example/controllers/first_form_controller.dart';
import 'package:form_example/shared/custom_scaffold.dart';

class FirstForm extends StatefulWidget {
  const FirstForm({super.key});

  @override
  FirstFormState createState() => FirstFormState();
}

class FirstFormState extends State<FirstForm> {
  final controller = FirstFormController();

  @override
  void initState() {
    super.initState();
    controller.loadUsers(setState);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Formulario Uno',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUnfocus,
          child: Column(
            children: [
              TextFormField(
                controller: controller.nombreController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: controller.validateNombre,
              ),
              TextFormField(
                controller: controller.correoController,
                decoration: const InputDecoration(labelText: 'Correo'),
                validator: controller.validateCorreo,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => controller.submit(context, setState),
                child: const Text('Enviar'),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.userList.length,
                  itemBuilder: (context, index) {
                    final user = controller.userList[index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      leading: CircleAvatar(child: Text(user.name[0])),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
