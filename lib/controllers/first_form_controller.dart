import 'package:flutter/material.dart';
import 'package:form_example/models/user.dart';
import 'package:form_example/services/user_service.dart';

class FirstFormController {
  final formKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final correoController = TextEditingController();

  final UserService userService = UserService();
  List<User> userList = [];

  String? validateNombre(String? value) {
    if (value == null || value.isEmpty) return 'Ingrese su nombre';
    return null;
  }

  String? validateCorreo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese su correo';
    }

    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Correo inválido';
    }

    return null;
  }

  Future<void> loadUsers(void Function(VoidCallback fn) setState) async {
    try {
      final users = await userService.fetchUsers();
      setState(() {
        userList = users;
      });
    } catch (e) {
      print('Error al cargar usuarios: $e');
    }
  }

  Future<void> submit(
    BuildContext context,
    void Function(VoidCallback fn) setState,
  ) async {
    if (!formKey.currentState!.validate()) return;

    final newUser = User(
      name: nombreController.text,
      email: correoController.text,
    );

    try {
      await userService.addUser(newUser);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuario agregado'),
            backgroundColor: Colors.green,
          ),
        );
      }
      nombreController.clear();
      correoController.clear();
      await loadUsers(setState);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error al enviar'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
