
import 'dart:convert';

import 'package:equatable/equatable.dart';

class RegistrationBody extends Equatable {
  final String name;
  final String email;
  final String password;
  const RegistrationBody({
    required this.name,
    required this.email,
    required this.password,
  });


  RegistrationBody copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return RegistrationBody(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory RegistrationBody.fromMap(Map<String, dynamic> map) {
    return RegistrationBody(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationBody.fromJson(String source) => RegistrationBody.fromMap(json.decode(source));

  @override
  String toString() => 'SignUp(name: $name, email: $email, password: $password)';

  @override
  List<Object> get props => [name, email, password];
}
