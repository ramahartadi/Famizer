import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:authentication/authentication.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic data;
  String? nama;
  String? status;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late User? userAuth = firebaseAuth.currentUser;
  late String? uid = userAuth?.uid;

  CollectionReference userReference =
      FirebaseFirestore.instance.collection('users');

  late DocumentReference userDoc =
      FirebaseFirestore.instance.collection('users').doc(uid);

  CollectionReference FamiliesReference =
      FirebaseFirestore.instance.collection('families');

  Query eventReference = FirebaseFirestore.instance
      .collection('families')
      .doc('qLyPcSCHfVJSj8W6QJXJ')
      .collection('events')
      .orderBy('date')
      .limit(1);

  DocumentReference family = FirebaseFirestore.instance
      .collection('families')
      .doc('qLyPcSCHfVJSj8W6QJXJ');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colors.background,
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  StreamBuilder(
                    stream: userDoc.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    context.colors.primaryContainer,
                                radius: 30,
                                child: snapshot.data!['imageUrl'] == ""
                                    ? SvgPicture.asset(
                                        'assets/image/avatar_placeholder.svg',
                                        package: 'home',
                                        color:
                                            context.colors.onPrimaryContainer,
                                      )
                                    : ClipOval(
                                        child: Image.network(
                                          snapshot.data!['imageUrl'],
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                              ),
                              title: Text(
                                '${snapshot.data!['name']}',
                                style: context.titleSmall?.copyWith(
                                    color: context.colors.onBackground),
                              ),
                              subtitle: Text(
                                '${snapshot.data!['status']}',
                                style: context.bodySmall
                                    ?.copyWith(color: context.colors.secondary),
                              ),
                              trailing: IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/icon/settings_24px.svg',
                                    package: 'home',
                                    color: context.colors.onSurfaceVariant,
                                  ),
                                  onPressed: () {
                                    context.pushNamed('settings');
                                  })),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  const SizedBox(height: 60),
                  StreamBuilder(
                      stream: family.snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              Card(
                                color: context.colors.primaryContainer,
                                margin: EdgeInsets.zero,
                                child: InkWell(
                                  splashColor: context.colors.primaryContainer,
                                  onTap: () {
                                    debugPrint('kegiatan mendatang Tapped.');
                                  },
                                  child: SizedBox(
                                    width: 400,
                                    height: 150,
                                    child: Container(
                                        child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'Keluarga Bahagia',
                                                        style: context
                                                            .titleLarge
                                                            ?.copyWith(
                                                                color: context
                                                                    .colors
                                                                    .onPrimaryContainer),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                      
                                                      ],
                                                  ),
                                             
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/image/Group 16.svg',
                                                package: 'home',
                                              ),
                                              SvgPicture.asset(
                                                'assets/image/Group 17.svg',
                                                package: 'home',
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                  const SizedBox(height: 20),
                  Container(
                      child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: context.colors.surfaceVariant,
                          margin: EdgeInsets.zero,
                          child: InkWell(
                            splashColor: context.colors.surfaceVariant,
                            onTap: () {
                              context.pushNamed('todo');
                              debugPrint('Daftar tugas Tapped.');
                            },
                            child: SizedBox(
                              height: 110,
                              child: Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.checklist,
                                        size: 36,
                                        color: context.colors.tertiary,
                                      ),
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      Text(
                                        'Daftar tugas',
                                        style: context.titleMedium?.copyWith(
                                            color: context.colors.onBackground),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(height: 20),
                  Container(
                      child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: context.colors.surfaceVariant,
                          margin: EdgeInsets.zero,
                          child: InkWell(
                            splashColor: context.colors.surfaceVariant,
                            onTap: () {
                              context.pushNamed('events');
                              debugPrint('Kegiatan Tapped.');
                            },
                            child: SizedBox(
                              height: 150,
                              child: Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.event_note,
                                        size: 36,
                                        color: context.customColors?.green,
                                      ),
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      Text(
                                        'Kegiatan',
                                        style: context.titleMedium?.copyWith(
                                            color: context.colors.onBackground),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Card(
                          color: context.colors.surfaceVariant,
                          margin: EdgeInsets.zero,
                          child: InkWell(
                            splashColor: context.colors.surfaceVariant,
                            onTap: () {
                              context.pushNamed('family');
                              debugPrint('Keluarga Tapped.');
                            },
                            child: SizedBox(
                              height: 150,
                              child: Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.house_outlined,
                                        size: 36,
                                        color: context.customColors?.purple,
                                      ),
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      Text(
                                        'Anggota Keluarga',
                                        style: context.titleMedium?.copyWith(
                                            color: context.colors.onBackground),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          );
        }),
      );
    
  }
}
