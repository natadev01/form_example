import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserService {
  final String baseUrl = 'http://localhost:3000/users'; // Cambia a tu IP si usas emulador físico

  // Obtener todos los usuarios
  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener usuarios');
    }
  }

  // Agregar un nuevo usuario
  Future<void> addUser(User user) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Error al agregar usuario');
    }
  }

  // Actualizar usuario (por índice en la lista)
  Future<void> updateUser(int index, User user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$index'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al actualizar usuario');
    }
  }

  // Eliminar usuario (por índice)
  Future<void> deleteUser(int index) async {
    final response = await http.delete(Uri.parse('$baseUrl/$index'));

    if (response.statusCode != 200) {
      throw Exception('Error al eliminar usuario');
    }
  }
}
