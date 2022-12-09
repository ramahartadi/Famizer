import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme/theme.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/model/tugas.dart';
import 'package:todo/model/list_tugas.dart';
import 'package:nanoid/nanoid.dart';

class addTodoPage extends StatefulWidget {
  const addTodoPage({super.key});

  @override
  State<addTodoPage> createState() => _addTodoPageState();
}

class _addTodoPageState extends State<addTodoPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = "";
    descriptionController.text = "";
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose;
    descriptionController.dispose;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Tugas'),
        actions: [
          IconButton(
              onPressed: () async {
                setState(() {
                  var tugasAdd = Tugas(nanoid(3), nameController.text,
                      descriptionController.text, []);
                  listTugas.add(tugasAdd);
                });
                Navigator.pop(context);
              },
              icon: Icon(Icons.check))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: nameController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text('Nama Daftar Tugas'),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: context.colors.onSurfaceVariant,
                ),
                tooltip: '',
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: descriptionController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text('Deskripsi'),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: context.colors.onSurfaceVariant,
                ),
                tooltip: '',
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            child: ListTile(
              title: Text('Terlihat untuk:'),
              subtitle: Text('Here is a second line'),
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(28),
                          topLeft: Radius.circular(28)),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              child: Icon(Icons.drag_handle),
                              width: double.infinity,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text('Siapa yang bisa melihat list ini?'),
                            ),
                            ListTile(
                              leading: Icon(Icons.lock_outline),
                              title: Text('Hanya saya'),
                            ),
                            ListTile(
                              leading: Icon(Icons.group_outlined),
                              title: Text('Semua orang di keluarga ini'),
                            ),
                            ListTile(
                              leading: Icon(Icons.group_add_outlined),
                              title: Text('Anggota spesifik'),
                              onTap: () => {
                                Navigator.pop(context),
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(28),
                                          topLeft: Radius.circular(28)),
                                    ),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              child: Icon(Icons.drag_handle),
                                              width: double.infinity,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Text('Pilih Anggota'),
                                            ),
                                            ListTile(
                                              leading: FlutterLogo(),
                                              title: Text('Ahmad'),
                                              trailing: Icon(Icons.add),
                                            ),
                                            ListTile(
                                              leading: FlutterLogo(),
                                              title: Text('Fathur'),
                                              trailing: Icon(Icons.close),
                                            ),
                                            SizedBox(
                                              height: 52,
                                            )
                                          ],
                                        ),
                                      );
                                    })
                              },
                            ),
                            SizedBox(
                              height: 52,
                            )
                          ],
                        ),
                      );
                    });
              },
            ),
          ),
        ]),
      ),
    );
  }
}
