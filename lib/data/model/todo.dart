// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Todo {
  final int? id;
  final String title;
  final DateTime date;
  final bool isCompleted;
  final String address;
  Todo({
    this.id,
    required this.title,
    required this.date,
    required this.isCompleted,
    required this.address,
  });

  Todo copyWith({
    int? id,
    String? title,
    DateTime? date,
    bool? isCompleted,
    String? address,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      isCompleted: isCompleted ?? this.isCompleted,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'isCompleted': isCompleted ? 1 : 0,
      'address': address,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      isCompleted: map['isCompleted'] == 1,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, date: $date, isCompleted: $isCompleted, address: $address)';
  }

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.date == date &&
        other.isCompleted == isCompleted &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        date.hashCode ^
        isCompleted.hashCode ^
        address.hashCode;
  }
}
