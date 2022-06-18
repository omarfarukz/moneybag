import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:money_bag/domain/app/source.dart';

class UserProfile extends Equatable {
  final String name;
  final String id;
  final String email;
  final List<Source> source;
  const UserProfile({
    required this.name,
    required this.id,
    required this.email,
    required this.source,
  });

  UserProfile copyWith({
    String? name,
    String? id,
    String? email,
    List<Source>? source,
  }) {
    return UserProfile(
      name: name ?? this.name,
      id: id ?? this.id,
      email: email ?? this.email,
      source: source ?? this.source,
    );
  }

  factory UserProfile.empty() =>
      const  UserProfile(name: "", id: "", email: "", source: []);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'email': email,
      'source': source.map((x) => x.toMap()).toList(),
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      name: map['name'] ?? '',
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      source: List<Source>.from(map['source']?.map((x) => Source.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserProfile(name: $name, id: $id, email: $email, source: $source)';
  }

  @override
  List<Object> get props => [name, id, email, source];
}
