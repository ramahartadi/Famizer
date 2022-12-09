import 'package:events/pages/chat.dart';
import 'package:flutter/material.dart';
import "package:events/pages/event_edit.dart";
import 'package:events/pages/chat_list.dart';

class EventDetail extends StatefulWidget {
  final String id;
  final String name;
  final String desciption;
  final String date;
  final String timeStart;
  final String timeEnd;
  const EventDetail(
      {Key? key,
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
  TextEditingController chat = TextEditingController();

  @override
  void initState() {
    super.initState();
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
            title: const Text("Family Trip"),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EventEdit(
                        id:widget.id,
                            name: widget.name,
                            desciption: widget.desciption,
                            date: widget.date,
                            startTime: widget.timeStart,
                            endTime: widget.timeEnd,
                          )));
                },
              )
            ],
            bottom: const TabBar(tabs: [
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
                      margin: const EdgeInsets.all(20),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        child: const Center(
                          child: Text(''),
                        ),
                      )),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(widget.name),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      Icon(Icons.schedule),
                      SizedBox(width: 5),
                      Text(widget.date),
                      SizedBox(width: 5),
                      Text("${widget.timeStart} - ${widget.timeEnd}")
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [SizedBox(width: 10), Text(widget.desciption)],
                  )
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                ListView.builder(
                  itemCount: messages.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 14, right: 14, top: 10, bottom: 10),
                        child: Align(
                          alignment: (messages[index].messageType == "receiver"
                              ? Alignment.topLeft
                              : Alignment.topRight),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (messages[index].messageType == "receiver"
                                  ? Colors.grey.shade200
                                  : Colors.blue[200]),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Text(
                              messages[index].messageContent,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: chat,
                            decoration: InputDecoration(
                                hintText: "Write message...",
                                hintStyle: TextStyle(color: Colors.black54),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              var newChat = ChatMessage(
                                  messageContent: chat.text,
                                  messageType: "sender");
                              messages.add(newChat);
                              clearText();
                            });
                          },
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          ),
                          backgroundColor: Colors.blue,
                          elevation: 0,
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
