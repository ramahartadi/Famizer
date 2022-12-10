import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class editTodoPage extends StatefulWidget {
  final String Id;

  const editTodoPage({Key? key, required this.Id}) : super(key: key);

  @override
  State<editTodoPage> createState() => _editTodoPageState(Id: Id);
}

class _editTodoPageState extends State<editTodoPage> {
  final String Id;
  _editTodoPageState({Key? key, required this.Id});

  TextEditingController _namaTugasController = TextEditingController();
  TextEditingController _deskripsiTugasController = TextEditingController();

  dynamic data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  CollectionReference collectionReference = FirebaseFirestore.instance
      .collection('families')
      .doc("qLyPcSCHfVJSj8W6QJXJ")
      .collection("todos");

  Future<dynamic> getData() async {
    final DocumentReference document = collectionReference.doc(Id);
    await document.get().then<dynamic>(
      (DocumentSnapshot snapshot) {
        setState(() {
          data = snapshot.data() as Map<String, dynamic>?;
          _namaTugasController.text = data?["name"];
          _deskripsiTugasController.text = data?["description"];
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _namaTugasController.dispose();
    _deskripsiTugasController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return AlertDialog(
                            title: Text("Apakah kamu ingin menghapus tugas?",
                                style: context.titleLarge?.copyWith(
                                    color: context.colors.onSurfaceVariant)),
                            content: Text(
                                "Tugas yang dihapus tidak bisa dikembalikan"),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: Text('Batal',
                                    style: context.bodyMedium?.copyWith(
                                        color: context.colors.primary)),
                              ),
                              TextButton(
                                onPressed: () => {
                                  Navigator.pop(context, 'OK'),
                                  Navigator.of(context).pop(),
                                },
                                child: Text(
                                  'OK',
                                  style: context.bodyMedium
                                      ?.copyWith(color: context.colors.primary),
                                ),
                              ),
                            ],
                          );
                        });
                      }),
                }),
        title: const Text('Pengaturan tugas'),
        actions: [
          IconButton(
              onPressed: () async {
                setState(() {
                  collectionReference.doc(Id).update({
                    'name': _namaTugasController.text,
                    'description': _deskripsiTugasController.text
                  });
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
            controller: _namaTugasController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text('Nama Daftar Tugas'),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: context.colors.onSurfaceVariant,
                ),
                tooltip: 'Delete',
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _deskripsiTugasController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text('Deskripsi'),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: context.colors.onSurfaceVariant,
                ),
                tooltip: 'Delete',
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
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: context.colors.primary,
              minimumSize: Size.fromHeight(40),
            ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(builder: (context, setState) {
                      return AlertDialog(
                        title: Text("Apakah kamu ingin menghapus tugas?",
                            style: context.titleLarge?.copyWith(
                                color: context.colors.onSurfaceVariant)),
                        content:
                            Text("Tugas yang dihapus tidak bisa dikembalikan"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: Text('Batal',
                                style: context.bodyMedium
                                    ?.copyWith(color: context.colors.primary)),
                          ),
                          TextButton(
                            onPressed: () {
                              setState((() {
                                // listTugas.removeAt(widget.index);
                              }));
                              Navigator.pop(context, 'OK');
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Text(
                              'OK',
                              style: context.bodyMedium
                                  ?.copyWith(color: context.colors.primary),
                            ),
                          ),
                        ],
                      );
                    });
                  });
            },
            child: const Text('Hapus Tugas'),
          ),
        ]),
      ),
    );
  }
}
