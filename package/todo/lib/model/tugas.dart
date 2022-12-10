import 'package:cloud_firestore/cloud_firestore.dart';

class Tugas {
  // final String? id;
  final String? name;
  final String? description;
  final bool? visibility;
  // List<member> member;
  final List<String>? todoList;

  Tugas({this.name, this.description, this.visibility, this.todoList});

  factory Tugas.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Tugas(
      name: data?['name'],
      description: data?['description'],
      visibility: data?['visibility'],
      todoList:
          data?['todoList'] is Iterable ? List.from(data?['todoList']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (description != null) "description": description,
      if (visibility != null) "visibility": visibility,
      if (todoList != null) "todoList": todoList,
    };
  }
}
