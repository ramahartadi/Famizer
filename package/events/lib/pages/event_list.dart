import 'package:events/pages/event_add.dart';
import 'package:events/pages/event_detail.dart';
import 'package:flutter/material.dart';
import 'package:events/pages/list.dart';
import 'package:theme/theme.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);
  static const routeName = '/event_list';

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        iconTheme: IconThemeData(
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
        child: Icon(Icons.add,color:context.colors.onPrimaryContainer),
        onPressed: () {
          Navigator.of(context).pushNamed(EventAdd.routeName);
        },
      ),
      body: eventList.isEmpty
          ? Center(
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
                      Text(
                        "Tidak ada kegiatan",
                        textAlign: TextAlign.center,
                        style: context.titleMedium?.copyWith(color: context.colors.onBackground)
                      ),
                      Text(
                        "Tambahkan tugas anda dengan menekan tombol di bawah",
                        textAlign: TextAlign.center,
                        style: context.bodyMedium?.copyWith(color: context.colors.onBackground)
                      )
                    ],
                  )),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Padding(
                    padding: const EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EventDetail(
                                  id:eventList[index].id,
                                  name: eventList[index].name,
                                  desciption: eventList[index].description,
                                  date: eventList[index].date,
                                  timeStart: eventList[index].startHour,
                                  timeEnd: eventList[index].endHour,
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
                                  eventList[index].name,
                                  style: context.titleMedium?.copyWith(color:context.colors.onBackground),
                                  
                                ),
                                Row(children: [
                                  const Icon(Icons.schedule,size: 15),
                                  const SizedBox(width: 5,),
                                  Text(
                                  eventList[index].date,
                                  style: context.bodySmall?.copyWith(color: context.colors.onSurfaceVariant)
                                ),
                                const SizedBox(width: 5,),
                                  Text("${eventList[index].startHour} - ${eventList[index].endHour}",
                                  style: context.bodySmall?.copyWith(color: context.colors.onSurfaceVariant)

                                  ),
                                ],),
                                Text(
                                  eventList[index].description,
                                  style: context.bodyMedium?.copyWith(color: context.colors.onSurfaceVariant)
                                ),
                              ],
                            ),
                          )),
                    ));
              },
              itemCount: eventList.length,
            ),
    );
  }
}
