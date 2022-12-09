import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme/theme.dart';
import 'package:todo/model/todo.dart';
import 'edit_todo_page.dart';
import '../../model/list_tugas.dart';

class TodoDetailPage extends StatefulWidget {
  final List<ToDo> todosList;
  final int index;
  TodoDetailPage({Key? key, required this.todosList, required this.index})
      : super(key: key);

  @override
  State<TodoDetailPage> createState() =>
      _TodoDetailState(todoData: todosList, index: index);
}

class _TodoDetailState extends State<TodoDetailPage> {
  final List<ToDo> todoData;
  final int index;
  _TodoDetailState({Key? key, required this.todoData, required this.index});
  final _todoController = TextEditingController();

  List<ToDo> _foundTodo = [];

  @override
  void initState() {
    super.initState();
    _foundTodo = todoData;
  }

  @override
  void dispose() {
    super.dispose();
    _todoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${listTugas[index].name}'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => editTodoPage(index: index)),
              );
            },
            icon: SvgPicture.asset(
              'assets/icon/mode_edit_24px.svg',
              package: 'todo',
            ),
          )
        ],
      ),
      body: Container(
        child: Column(children: [
          Container(
            child: ListTile(
              contentPadding: EdgeInsets.only(right: 16, left: 16, top: 4),
              leading: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _addTodoItem(_todoController.text);
                },
              ),
              title: TextField(
                controller: _todoController,
                decoration: InputDecoration(
                  hintText: "Tambahkan todo detail item",
                  border: InputBorder.none,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.cancel_outlined),
                onPressed: () {
                  _todoController.clear();
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _foundTodo.length,
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.centerLeft,
                    color: context.colors.errorContainer,
                    child: Icon(
                      Icons.delete_outline,
                      color: context.colors.onErrorContainer,
                    ),
                  ),
                  key: ValueKey<ToDo>(_foundTodo[index]),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      _deleteTodoItem(_foundTodo[index].id!);
                    });
                  },
                  child: ListTile(
                    onTap: () {
                      _handleTodoChange(_foundTodo[index]);
                    },
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    leading: Icon(_foundTodo[index].isDone
                        ? Icons.check_box
                        : Icons.check_box_outline_blank),
                    title: Text(
                      '${_foundTodo[index].todoText}',
                      style: TextStyle(
                        decoration: _foundTodo[index].isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }

  void _handleTodoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todoData.removeWhere((item) => item.id == id);
    });
  }

  void _addTodoItem(String toDo) {
    setState(() {
      todoData.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    _todoController.clear();
  }
}