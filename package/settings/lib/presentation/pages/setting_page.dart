import 'package:authentication/presentation/blocs/app/app_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:theme/theme.dart';
import 'package:about/about.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late User? userAuth = firebaseAuth.currentUser;
  late String? uid = userAuth?.uid;
  late String? userId = uid;

  dynamic data;

  String? nameUser = "";
  String? emailUser = "";
  String? profilePicLink = "";

  late DocumentReference userDoc =
      FirebaseFirestore.instance.collection('users').doc(uid);

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');

  Future<dynamic> getData() async {
    final DocumentReference document = collectionReference.doc(userId);
    await document.get().then<dynamic>(
      (DocumentSnapshot snapshot) {
        setState(() {
          data = snapshot.data() as Map<String, dynamic>?;
          nameUser = data?["name"];
          emailUser = data?["email"];
          profilePicLink = data?["imageUrl"];
        });
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Pengaturan'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: context.colors.primaryContainer,
                  radius: 50,
                  child: profilePicLink == ""
                      ? SvgPicture.asset(
                          'assets/avatar_placeholder.svg',
                          package: 'settings',
                          color: context.colors.onPrimaryContainer,
                        )
                      : ClipOval(child: Image.network(profilePicLink!)),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameUser!,
                      style: context.titleLarge?.copyWith(
                        color: context.colors.onBackground,
                      ),
                    ),
                    Text(
                      emailUser!,
                      style: context.bodyMedium?.copyWith(
                        color: context.colors.onBackground,
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                          text: 'Edit Profil',
                          style: context.labelLarge?.copyWith(
                            color: context.colors.primary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = (() {
                              context.goNamed('editProfile');
                            })),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...ListTile.divideTiles(context: context, tiles: [
            Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: SizedBox(
                height: 60,
                child: ListTile(
                  leading: Icon(
                    Icons.info_outline,
                    color: context.colors.onSurfaceVariant,
                  ),
                  title: Text(
                    'Tentang',
                    style: context.titleMedium?.copyWith(
                      color: context.colors.onBackground,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: context.colors.onSurfaceVariant,
                  ),
                  onTap: () {
                    showAboutPage(
                      context: context,
                      values: {
                        'version': '1.0',
                        'year': DateTime.now().year.toString(),
                      },
                      applicationName: 'Famizer',
                      applicationLegalese:
                          'Created by msib batch 3 capstone team, {{ year }}',
                      applicationDescription: const Text(
                          'Fathur Nor Alif\nRama Destrian Hartadi\nMuhammad Rayi\nQolbi Nurwandi Yunus'),
                      children: const <Widget>[
                        LicensesPageListTile(
                          icon: Icon(Icons.favorite),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: SizedBox(
                height: 60,
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: context.colors.onSurfaceVariant,
                  ),
                  title: Text(
                    'Keluar',
                    style: context.titleMedium?.copyWith(
                      color: context.colors.onBackground,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: context.colors.onSurfaceVariant,
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: const Text('Apakah anda ingin keluar'),
                          actions: [
                            TextButton(
                              child: const Text('Batal'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: const Text('Ok'),
                              onPressed: () {
                                context
                                    .read<AppBloc>()
                                    .add(AppLogoutRequested());
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ]).toList(),
        ],
      ),
    );
  }
}
