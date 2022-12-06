import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme/theme.dart';
import 'package:todo/model/todo.dart';
import 'add_todo_page.dart';
import 'todo_detail_page.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List<String> entries = <String>['Belanja', 'PR'];
  // final List<String> entries = <String>[];
  final List<String> entries2 = <String>[
    'Belanja untuk kebutuhan makan malam acara malam ini',
    'Tugas rumah yang harus dilakukan'
  ];
  final List<String> entries3 = <String>['5', '15'];
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
      body: entries.isEmpty
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
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Card(
                    color: context.colors.surfaceVariant,
                    child: ListTile(
                      // tileColor: context.colors.surfaceVariant,
                      title: Text('${entries[index]}',
                          style: context.titleMedium
                              ?.copyWith(color: context.colors.onBackground)),
                      subtitle: Text('${entries2[index]}',
                          style: context.bodyMedium?.copyWith(
                              color: context.colors.onSurfaceVariant)),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${entries3[index]} tugas',
                              style: context.bodyMedium?.copyWith(
                                  color: context.colors.onSurfaceVariant)),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TodoDetailPage()),
                        );
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
            );
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
