import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme/theme.dart';
import '../../model/list_tugas.dart';
import 'add_todo_page.dart';
import 'todo_detail_page.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Daftar Tugas"),
      ),
      body: listTugas.isEmpty
          ? Center(
              child: Container(
                  width: 265,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/image/Group 18.svg',
                        package: 'todo',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Tidak ada daftar tugas',
                          style: context.titleMedium
                              ?.copyWith(color: context.colors.onBackground)),
                      Text(
                        'Tambahkan tugas anda dengan menekan tombol tambahkan di bawah',
                        style: context.bodyMedium
                            ?.copyWith(color: context.colors.onBackground),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: listTugas.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Card(
                    color: context.colors.surfaceVariant,
                    child: ListTile(
                      // tileColor: context.colors.surfaceVariant,
                      title: Text('${listTugas[index].name}',
                          style: context.titleMedium
                              ?.copyWith(color: context.colors.onBackground)),
                      subtitle: Text('${listTugas[index].description}',
                          style: context.bodyMedium?.copyWith(
                              color: context.colors.onSurfaceVariant)),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              '${listTugas[index].todoList.length.toString()} tugas',
                              style: context.bodyMedium?.copyWith(
                                  color: context.colors.onSurfaceVariant)),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TodoDetailPage(
                                    todosList: listTugas[index].todoList,
                                    index: index,
                                  )),
                        ).then((value) {
                          setState(() {});
                        });
                      },
                      isThreeLine: true,
                    ),
                  ),
                );
              }),
      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 12, bottom: 52),
        child: FloatingActionButton(
          backgroundColor: context.colors.primaryContainer,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const addTodoPage()),
            ).then((value) {
              setState(() {});
            });
          },
          child: Icon(
            Icons.add,
            color: context.colors.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}
