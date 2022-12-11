import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EventAdd extends StatefulWidget {
  const EventAdd({Key? key}) : super(key: key);
  static const routeName = '/add_event';

  @override
  State<EventAdd> createState() => _EventAddState();
}

class _EventAddState extends State<EventAdd> {

  String imageUpload = '';
  void uploadImage(String imageName) async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    Reference ref = FirebaseStorage.instance.ref().child("$imageName.jpg");

    await ref.putFile(File(image!.path));

    ref.getDownloadURL().then((value) async {
      setState(() {
        imageUpload = value;
      });
    });
  }

  CollectionReference ref = FirebaseFirestore.instance
      .collection("families")
      .doc("qLyPcSCHfVJSj8W6QJXJ")
      .collection("events");

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeStartController = TextEditingController();
  TextEditingController timeEndController = TextEditingController();
  TimeOfDay time = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    nameController.text = "";
    descriptionController.text = "";
    dateController.text = "";
    timeStartController.text = "";
    timeEndController.text = "";
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    timeStartController.dispose();
    timeEndController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text("Tambah Kegiatan"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.done,
                color: Colors.black,
              ),
              onPressed: () async {
                /*var eventAdd = Event(
                    nanoid(),
                    nameController.text,
                    descriptionController.text,
                    dateController.text,
                    timeStartController.text,
                    timeEndController.text,
                  );*/
                // eventList.add(eventAdd);
                Map<String, String> addEvent = {
                  "url" :imageUpload,
                  "name": nameController.text,
                  "description": descriptionController.text,
                  "date": dateController.text,
                  "timeStart": timeStartController.text,
                  "timeEnd": timeEndController.text
                };
                FirebaseFirestore.instance
                    .collection("families")
                    .doc("qLyPcSCHfVJSj8W6QJXJ")
                    .collection("events")
                    .add(addEvent);
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                child: Card(
                    margin: const EdgeInsets.all(20),
                    child: SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Center(
                        child: imageUpload != ""
                            ? Image.network(imageUpload)
                            : const Center(
                                child: Text('Klik untuk tambah foto'),
                              ),
                      ),
                    )),
                onTap: () {
                  uploadImage(nameController.text);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Isi dengan nama kegiatan",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: "Isi dengan deskripsi kegiatan",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                    controller: dateController,
                    decoration: const InputDecoration(
                      labelText: "Isi dengan tanggal",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat("yyyy-MM-dd").format(pickedDate);
                        setState(() {
                          dateController.text = formattedDate.toString();
                        });
                      } else {
                        debugPrint("Not selected");
                      }
                    }),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: timeStartController,
                        decoration: const InputDecoration(
                          labelText: "Waktu mulai",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        onTap: () async {
                          TimeOfDay? newTimeStart = await showTimePicker(
                              context: context, initialTime: time);
                          if (newTimeStart != null) {
                            timeStartController.text =
                                newTimeStart.format(context);
                            setState(() {
                              time = newTimeStart;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: timeEndController,
                        decoration: const InputDecoration(
                          labelText: "Waktu selesai",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        onTap: () async {
                          TimeOfDay? newTimeEnd = await showTimePicker(
                              context: context, initialTime: time);
                          if (newTimeEnd != null) {
                            timeEndController.text = newTimeEnd.format(context);
                            setState(() {
                              time = newTimeEnd;
                            });
                          }
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
