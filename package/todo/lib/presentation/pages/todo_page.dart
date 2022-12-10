import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme/theme.dart';
import 'add_todo_page.dart';
import 'todo_detail_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // dynamic data;
  // dynamic allTugasData;

  CollectionReference collectionReference = FirebaseFirestore.instance
      .collection('families')
      .doc("qLyPcSCHfVJSj8W6QJXJ")
      .collection("todos");

  // Future<dynamic> getTodoData() async {
  //   final DocumentReference document =
  //       collectionReference.doc('q73qvYv9vENiL8yr5GS3');
  //   await document.get().then<dynamic>(
  //     (DocumentSnapshot snapshot) {
  //       setState(() {
  //         data = snapshot.data() as Map<String, dynamic>?;
  //         print(data?["todoList"][0]["isDone"]);
  //       });
  //     },
  //   );

  //   print("ini adalah getTodoData");
  // }

  // Future<void> nyobaGetData() async {
  //   QuerySnapshot querySnapshot = await collectionReference.get();

  //   allTugasData = querySnapshot.docs.map((doc) => doc.data()).toList();
  //   print(allTugasData);
  //   print("ini adalah nyobaGetData");
  // }

  @override
  void initState() {
    super.initState();
    // getTodoData();
    // nyobaGetData();
  }

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
      body: StreamBuilder(
          stream: collectionReference.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Card(
                        color: context.colors.surfaceVariant,
                        child: ListTile(
                          // tileColor: context.colors.surfaceVariant,
                          title: Text(
                              '${snapshot.data!.docs[index].get('name')}',
                              style: context.titleMedium?.copyWith(
                                  color: context.colors.onBackground)),
                          subtitle: Text(
                              '${snapshot.data!.docs[index].get('description')}',
                              style: context.bodyMedium?.copyWith(
                                  color: context.colors.onSurfaceVariant)),
                          // trailing: Column(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text(
                          //         '${snapshot.data!.docs[index].get('todoList').length} tugas',
                          //         style: context.bodyMedium?.copyWith(
                          //             color: context.colors.onSurfaceVariant)),
                          //   ],
                          // ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TodoDetailPage(
                                        Id: snapshot
                                            .data!.docs[index].reference.id,
                                      )),
                            ).then((value) {
                              setState(() {});
                            });
                          },
                          isThreeLine: true,
                        ),
                      ),
                    );
                  });
            }
            if (snapshot.hasError) {
              return Center(
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
              );
            } else {
              return Center(
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
                        Text('ERROR',
                            style: context.titleMedium
                                ?.copyWith(color: context.colors.onBackground)),
                        Text(
                          'ERROR',
                          style: context.bodyMedium
                              ?.copyWith(color: context.colors.onBackground),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
              );
            }
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
