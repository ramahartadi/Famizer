import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';

class EditTodoPage extends StatefulWidget {
  final String Id;

  const EditTodoPage({Key? key, required this.Id}) : super(key: key);

  @override
  State<EditTodoPage> createState() => _EditTodoPageState(Id: Id);
}

class _EditTodoPageState extends State<EditTodoPage> {
  final String Id;
  _EditTodoPageState({Key? key, required this.Id});

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
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return AlertDialog(
                            title: Text("Apakah kamu ingin menghapus tugas?",
                                style: context.titleLarge?.copyWith(
                                    color: context.colors.onSurfaceVariant)),
                            content: const Text(
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
                Navigator.pop(context);
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          const SizedBox(
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
                onPressed: () {
                  _namaTugasController.clear();
                },
              ),
            ),
          ),
          const SizedBox(
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
                onPressed: () {
                  _deskripsiTugasController.clear();
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: context.colors.primary,
              minimumSize: const Size.fromHeight(40),
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
                        content: const Text(
                            "Tugas yang dihapus tidak bisa dikembalikan"),
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
                                collectionReference.doc(Id).delete();
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
