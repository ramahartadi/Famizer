import 'package:flutter/material.dart';
import "package:events/pages/event_edit.dart";
import 'package:theme/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventDetail extends StatefulWidget {
  final String url;
  final String id;
  final String name;
  final String desciption;
  final String date;
  final String timeStart;
  final String timeEnd;
  const EventDetail(
      {Key? key,
      required this.url,
      required this.id,
      required this.name,
      required this.desciption,
      required this.date,
      required this.timeStart,
      required this.timeEnd})
      : super(key: key);
  static const routeName = '/event_detail';

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  CollectionReference? ref;
  Query? ref2;

  TextEditingController chat = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref = FirebaseFirestore.instance
        .collection("families")
        .doc("qLyPcSCHfVJSj8W6QJXJ")
        .collection("events")
        .doc(widget.id)
        .collection("discussions");
    ref2=FirebaseFirestore.instance
        .collection("families")
        .doc("qLyPcSCHfVJSj8W6QJXJ")
        .collection("events")
        .doc(widget.id)
        .collection("discussions").orderBy("timeStamp");
    chat.text = '';
  }

  @override
  void dispose() {
    super.dispose();
    chat.dispose();
  }

  void clearText() {
    chat.clear();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: (() => Navigator.of(context).pop()),
                icon: const Icon(Icons.arrow_back)),
            iconTheme: const IconThemeData(
              color: Colors.black, //change your color here
            ),
            title: Text(widget.name),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.edit,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EventEdit(
                            url: widget.url,
                            id: widget.id,
                            name: widget.name,
                            desciption: widget.desciption,
                            date: widget.date,
                            startTime: widget.timeStart,
                            endTime: widget.timeEnd,
                          )));
                },
              )
            ],
            bottom: TabBar(
                indicatorColor: context.colors.primary,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: "Detail"),
                  Tab(
                    text: "Diskusi",
                  )
                ]),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                      borderOnForeground: true,
                      margin: EdgeInsets.all(20),
                      child: SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Center(
                          child: widget.url != ""
                              ? Image.network(widget.url)
                              : const Center(
                                  child: Text('Tidak ada foto'),
                                ),
                        ),
                      )),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Text(widget.name, style: context.headlineSmall),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const Icon(Icons.schedule),
                      const SizedBox(width: 5),
                      Text(widget.date,
                          style: context.bodySmall?.copyWith(
                              color: context.colors.onSurfaceVariant)),
                      const SizedBox(width: 5),
                      Text("${widget.timeStart} - ${widget.timeEnd}",
                          style: context.bodySmall?.copyWith(
                              color: context.colors.onSurfaceVariant))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Text(widget.desciption,
                          style: context.bodyLarge
                              ?.copyWith(color: context.colors.onBackground))
                    ],
                  )
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                StreamBuilder(
                  stream: ref2!.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        //padding: const EdgeInsets.only(top: 10, bottom: 10),
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.only(top:10,bottom: 10,right: 10,left: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: context.colors.surfaceVariant),
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  '${snapshot.data!.docs[index].get("chat")}',
                                  style: context.bodyMedium?.copyWith(
                                      color: context.colors.onSurface),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: const EdgeInsets.only(top:5,right: 5,left: 5,bottom: 10),
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: chat,
                            decoration: InputDecoration(
                                hintText: "Ketik pesan",
                                hintStyle: context.bodySmall?.copyWith(
                                    color: context.colors.onBackground),
                                border: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            Map<String, dynamic> addChat = {
                              "chat": chat.text,
                              "timeStamp":FieldValue.serverTimestamp()
                            };
                            ref!.add(addChat);
                            chat.clear();
                          },
                          backgroundColor: Colors.white,
                          elevation: 0,
                          child: const Icon(
                            Icons.send,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
