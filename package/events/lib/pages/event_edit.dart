import 'package:events/pages/list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:events/model/event.dart';
import 'package:theme/theme.dart';

class EventEdit extends StatefulWidget {
  final String id;
  final String name;
  final String desciption;
  final String date;
  final String startTime;
  final String endTime;
  const EventEdit(
      {Key? key,
      required this.id,
      required this.name,
      required this.desciption,
      required this.date,
      required this.startTime,
      required this.endTime})
      : super(key: key);
  static const routeName = '/event_edit';

  @override
  State<EventEdit> createState() => _EventEditState();
}

class _EventEditState extends State<EventEdit> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeStartController = TextEditingController();
  TextEditingController timeEndController = TextEditingController();
  TimeOfDay time = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    descriptionController.text = widget.desciption;
    dateController.text = widget.date;
    timeStartController.text = widget.startTime;
    timeEndController.text = widget.endTime;
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
          title: const Text("Edit Kegiatan"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
              onPressed: () async {
                setState(() {
                  var eventEdit = Event(
                      widget.id,
                      nameController.text,
                      descriptionController.text,
                      dateController.text,
                      timeStartController.text,
                      timeEndController.text);
                  eventList[eventList.indexWhere((element) => element.id == widget.id)] = eventEdit;
                });
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
                  color: context.colors.primaryContainer,
                    margin: const EdgeInsets.all(20),
                    child: const SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Center(
                        child: Text(''),
                      ),
                    )),
                onTap: () {},
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
                        print("Not selected");
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
              ),
              const SizedBox(height: 20),
              Container(
                height: 60,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      eventList.removeWhere((element) => element.id == widget.id);
                    });
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    color: context.colors.primary,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32))),
                    child: const Center(
                      child: Text("Hapus kegiatan"),
                    ),
                  ),)
                ),
              )
            ],
          ),
        ));
  }
}

