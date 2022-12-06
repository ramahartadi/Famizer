import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme/theme.dart';
import 'package:todo/model/todo.dart';
import 'edit_todo_page.dart';

class TodoDetailPage extends StatefulWidget {
  TodoDetailPage({super.key});
  final todosList = ToDo.todoList();

  @override
  State<TodoDetailPage> createState() => _TodoDetailState(todoData: todosList);
}

class _TodoDetailState extends State<TodoDetailPage> {
  List<int> items = List<int>.generate(10, (int index) => index);
  final List<ToDo> todoData;
  _TodoDetailState({Key? key, required this.todoData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belanja'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const editTodoPage()),
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
              leading: Icon(Icons.add),
              title: Text('One-line with both widgets'),
              trailing: Icon(Icons.cancel_outlined),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoData.length,
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
                  key: ValueKey<int>(items[index]),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    leading: Icon(todoData[index].isDone
                        ? Icons.check_box
                        : Icons.check_box_outline_blank),
                    title: Text(
                      '${todoData[index].todoText}',
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
}
