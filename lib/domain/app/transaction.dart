
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final double amount;
  final DateTime time;
  final String source;
  final String transactionType;
  final String note;
  const Transaction({
    required this.amount,
    required this.time,
    required this.source,
    required this.transactionType,
    required this.note,
  });
  


  Transaction copyWith({
    double? amount,
    DateTime? time,
    String? source,
    String? transactionType,
    String? note,
  }) {
    return Transaction(
      amount: amount ?? this.amount,
      time: time ?? this.time,
      source: source ?? this.source,
      transactionType: transactionType ?? this.transactionType,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'time': time.millisecondsSinceEpoch,
      'source': source,
      'transactionType': transactionType,
      'note': note,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      amount: map['amount']?.toDouble() ?? 0.0,
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      source: map['source'] ?? '',
      transactionType: map['transactionType'] ?? '',
      note: map['note'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) => Transaction.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Transaction(amount: $amount, time: $time, source: $source, transactionType: $transactionType, note: $note)';
  }

  @override
  List<Object> get props {
    return [
      amount,
      time,
      source,
      transactionType,
      note,
    ];
  }
}
