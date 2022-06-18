import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginBody extends Equatable {

  final String email;
  final String password;
  const LoginBody({
    required this.email,
    required this.password,
  });


  LoginBody copyWith({
    String? email,
    String? password,
  }) {
    return LoginBody(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginBody.fromMap(Map<String, dynamic> map) {
    return LoginBody(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginBody.fromJson(String source) => LoginBody.fromMap(json.decode(source));

  @override
  String toString() => 'LoginBody(email: $email, password: $password)';

  @override
  List<Object> get props => [email, password];
}
