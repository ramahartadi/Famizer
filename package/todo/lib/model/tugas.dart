import 'todo.dart';

class Tugas {
  final String id;
  final String name;
  final String description;
  // final String visibility;
  // List<member> member;
  final List<ToDo> todoList;

  Tugas(this.id, this.name, this.description, this.todoList);
}
