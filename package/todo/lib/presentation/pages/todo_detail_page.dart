import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme/theme.dart';
import 'edit_todo_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoDetailPage extends StatefulWidget {
  final String Id;
  TodoDetailPage({Key? key, required this.Id}) : super(key: key);

  @override
  State<TodoDetailPage> createState() => _TodoDetailState(Id: Id);
}

class _TodoDetailState extends State<TodoDetailPage> {
  final String Id;
  _TodoDetailState({Key? key, required this.Id});
  final _todoController = TextEditingController();
  String name = "Tugas";
  dynamic data;
  CollectionReference? collectionReferenceTodolist;
  DocumentReference? docRefTugas;

  @override
  void initState() {
    super.initState();
    docRefTugas = FirebaseFirestore.instance
        .collection('families')
        .doc("qLyPcSCHfVJSj8W6QJXJ")
        .collection("todos")
        .doc(Id);

    collectionReferenceTodolist = docRefTugas!.collection("todoList");
    getData();
  }

  Future<dynamic> getData() async {
    await docRefTugas!.get().then<dynamic>(
      (DocumentSnapshot snapshot) {
        setState(() {
          data = snapshot.data() as Map<String, dynamic>?;
          name = data?["name"];
          print("name" + name);
        });
      },
    );
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
        title: Text(name),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditTodoPage(Id: Id)),
              );
            },
            icon: SvgPicture.asset(
              'assets/icon/mode_edit_24px.svg',
              package: 'todo',
            ),
          )
        ],
      ),
      body: StreamBuilder(
          stream: collectionReferenceTodolist!.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Column(children: [
                  Container(
                    child: ListTile(
                      contentPadding:
                          const EdgeInsets.only(right: 16, left: 16, top: 4),
                      leading: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          collectionReferenceTodolist!.add({
                            'todo': '',
                            'task': _todoController.text,
                            'isDone': false,
                          });
                          _todoController.clear();
                          // _addTodoItem(_todoController.text);
                        },
                      ),
                      title: TextField(
                        controller: _todoController,
                        decoration: const InputDecoration(
                          hintText: "Tambahkan todo detail item",
                          border: InputBorder.none,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.cancel_outlined),
                        onPressed: () {
                          _todoController.clear();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          background: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            alignment: Alignment.centerLeft,
                            color: context.colors.errorContainer,
                            child: Icon(
                              Icons.delete_outline,
                              color: context.colors.onErrorContainer,
                            ),
                          ),
                          key: UniqueKey(),
                          onDismissed: (DismissDirection direction) {
                            setState(() {
                              collectionReferenceTodolist!
                                  .doc(snapshot.data!.docs[index].reference.id)
                                  .delete();
                              // _deleteTodoItem(_foundTodo[index].id!);
                            });
                          },
                          child: ListTile(
                            onTap: () {
                              collectionReferenceTodolist!
                                  .doc(snapshot.data!.docs[index].reference.id)
                                  .update({
                                'isDone':
                                    !snapshot.data!.docs[index].get('isDone')
                              });
                            },
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            leading: Icon(
                                snapshot.data!.docs[index].get('isDone')
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank),
                            title: Text(
                              '${snapshot.data!.docs[index].get('task')}',
                              style: TextStyle(
                                decoration:
                                    snapshot.data!.docs[index].get('isDone')
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
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

  void _handleTodoChange(bool isDone, String id) {
    setState(() {
      isDone = !isDone;
    });
  }

  // void _deleteTodoItem(String id) {
  //   setState(() {
  //     todoData.removeWhere((item) => item.id == id);
  //   });
  // }

  // void _addTodoItem(String toDo) {
  //   setState(() {
  //     todoData.add(ToDo(
  //         id: DateTime.now().millisecondsSinceEpoch.toString(),
  //         todoText: toDo));
  //   });
  //   _todoController.clear();
  // }
}
