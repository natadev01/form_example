class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  // Convertir JSON a objeto User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }

  // Convertir objeto User a JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}
