import 'package:events/pages/event_add.dart';
import 'package:events/pages/event_detail.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);
  static const routeName = '/event_list';

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection("families")
      .doc("qLyPcSCHfVJSj8W6QJXJ")
      .collection("events");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        leading: IconButton(
                onPressed: (() => Navigator.of(context).pop()),
                icon: const Icon(Icons.arrow_back)),
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text(
            "Kegiatan",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: context.colors.surface),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.colors.primaryContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Icon(Icons.add, color: context.colors.onPrimaryContainer),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EventAdd()),
          );
        },
      ),
      body: StreamBuilder(
          stream: ref.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: SizedBox(
                      width: 280,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: context.colors.primaryContainer,
                            radius: 30,
                            child: const Icon(Icons.event_note, size: 30),
                          ),
                          Text("Tidak ada kegiatan",
                              textAlign: TextAlign.center,
                              style: context.titleMedium?.copyWith(
                                  color: context.colors.onBackground)),
                          Text(
                              "Tambahkan tugas anda dengan menekan tombol di bawah",
                              textAlign: TextAlign.center,
                              style: context.bodyMedium?.copyWith(
                                  color: context.colors.onBackground))
                        ],
                      )),
                );
              } else {
                return ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Padding(
                        padding: const EdgeInsets.all(5),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EventDetail(
                                      url:snapshot.data!.docs[index].get("url"),
                                      id: snapshot.data!.docs[index].id,
                                      name: snapshot.data!.docs[index]
                                          .get("name"),
                                      desciption: snapshot.data!.docs[index]
                                          .get("description"),
                                      date: snapshot.data!.docs[index]
                                          .get("date"),
                                      timeStart: snapshot.data!.docs[index]
                                          .get("timeStart"),
                                      timeEnd: snapshot.data!.docs[index]
                                          .get("timeEnd"),
                                    )));
                          },
                          child: Card(
                              color: context.colors.surfaceVariant,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${snapshot.data!.docs[index].get("name")}',
                                      style: context.titleMedium?.copyWith(
                                          color: context.colors.onBackground),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.schedule, size: 15),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                            '${snapshot.data!.docs[index].get("date")}',
                                            style: context.bodySmall?.copyWith(
                                                color: context
                                                    .colors.onSurfaceVariant)),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                            "${snapshot.data!.docs[index].get("timeStart")} - ${snapshot.data!.docs[index].get("timeEnd")}",
                                            style: context.bodySmall?.copyWith(
                                                color: context
                                                    .colors.onSurfaceVariant)),
                                      ],
                                    ),
                                    Text(
                                        '${snapshot.data!.docs[index].get("description")}',
                                        style: context.bodyMedium?.copyWith(
                                            color: context
                                                .colors.onSurfaceVariant)),
                                  ],
                                ),
                              )),
                        ));
                  },
                  itemCount: snapshot.data!.docs.length,
                );
              }
            }
            else if (snapshot.hasError) {
              return const Center(child:CircularProgressIndicator());
            } else {
              return const Center(child:CircularProgressIndicator());
            }
          }),
    );
  }
}
