import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class FamilyMember extends StatelessWidget {
  const FamilyMember({Key? key}) : super(key: key);
  static const routeName = '/family_member';

  @override
  Widget build(BuildContext context) {
    CollectionReference ref = FirebaseFirestore.instance.collection("users");
    Query ref2 = FirebaseFirestore.instance.collection("users").orderBy("timestamp");

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: (() => Navigator.of(context).pop()),
                icon: const Icon(Icons.arrow_back)),
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: context.colors.surface,
            title: const Text("Anggota Keluarga",
                style: TextStyle(color: Colors.black)),            
            bottom: TabBar(
                indicatorColor: context.colors.primary,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: "Member"),
                  Tab(
                    text: "Informasi",
                  )
                ]),
          ),
          body: TabBarView(children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: StreamBuilder(
                stream: ref.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemBuilder: (ctx, index) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: ListTile(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              tileColor: context.colors.surfaceVariant,
                              leading: Container(
                                height: double.infinity,
                                child: Icon(Icons.person),
                              ),
                              title: Text(
                                '${snapshot.data!.docs[index].get("name")}',
                                style: context.titleMedium?.copyWith(
                                    color: context.colors.onBackground),
                              ),
                              subtitle: Text(
                                '${snapshot.data!.docs[index].get("status")}',
                                style: context.bodyMedium?.copyWith(
                                    color: context.colors.onSurfaceVariant),
                              ),
                              trailing: Icon(Icons.emoji_emotions),
                            ),
                          ),
                        );
                      },
                      itemCount: snapshot.data!.docs.length,
                    );
                  } else if (snapshot.hasError) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            StreamBuilder(
                stream: ref2.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: ListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    tileColor: context.colors.surfaceVariant,
                    leading: Container(
                      height: double.infinity,
                      child: Icon(Icons.abc),
                    ),
                    title: Text("Dibuat oleh",
                        style: context.titleMedium
                            ?.copyWith(color: context.colors.onBackground)),
                    subtitle: Text('${snapshot.data!.docs[0].get("name")}',
                        style: context.bodyMedium
                            ?.copyWith(color: context.colors.onSurfaceVariant)),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: ListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    tileColor: context.colors.surfaceVariant,
                    leading: Container(
                      height: double.infinity,
                      child: Icon(Icons.date_range),
                    ),
                    title: Text("Tanggal dibuat",
                        style: context.titleMedium
                            ?.copyWith(color: context.colors.onBackground)),
                    subtitle: Text('${snapshot.data!.docs[0].get("date")}',
                        style: context.bodyMedium
                            ?.copyWith(color: context.colors.onSurfaceVariant)),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: ListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    tileColor: context.colors.surfaceVariant,
                    leading: Container(
                      height: double.infinity,
                      child: Icon(Icons.abc),
                    ),
                    title: Text("Kode keluarga",
                        style: context.titleMedium
                            ?.copyWith(color: context.colors.onBackground)),
                    subtitle: Text("CAPSTONE",
                        style: context.bodyMedium
                            ?.copyWith(color: context.colors.onSurfaceVariant)),
                  ),
                ),
              ],
            );
                  } else if (snapshot.hasError) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
    ]),
        ));
  }
}
