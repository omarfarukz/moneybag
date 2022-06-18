import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Source extends Equatable {
  final String name;
  final DateTime createAt;
  const Source({
    required this.name,
    required this.createAt,
  });

  Source copyWith({
    String? name,
    DateTime? createAt,
  }) {
    return Source(
      name: name ?? this.name,
      createAt: createAt ?? this.createAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'createAt': Timestamp.fromDate(createAt),
    };
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      name: map['name'] ?? '',
      createAt: map["createAt"] != null
          ? (map["createAt"] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Source.fromJson(String source) => Source.fromMap(json.decode(source));

  @override
  String toString() => 'Source(name: $name, createAt: $createAt)';

  @override
  List<Object> get props => [name, createAt];
}
