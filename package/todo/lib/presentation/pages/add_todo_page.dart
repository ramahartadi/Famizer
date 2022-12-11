import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:todo/model/tugas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  CollectionReference collectionReference = FirebaseFirestore.instance
      .collection('families')
      .doc("qLyPcSCHfVJSj8W6QJXJ")
      .collection("todos");

  Future<void> addTodo(Tugas tugas) {
    return collectionReference
        .add({
          'name': tugas.name,
          'description': tugas.description,
          'todoList': [],
        })
        .then((value) => print("todo added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

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
                  var tugasAdd = Tugas(
                      name: nameController.text,
                      description: descriptionController.text,
                      todoList: []);
                  addTodo(tugasAdd);
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
        ]),
      ),
    );
  }
}
