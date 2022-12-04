import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.colors.background,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: ListTile(
                    leading: FlutterLogo(size: 40),
                    title: Text(
                      'Ahmad',
                      style: context.titleSmall
                          ?.copyWith(color: context.colors.onBackground),
                    ),
                    subtitle: Text(
                      'Sedang sibuk',
                      style: context.bodySmall
                          ?.copyWith(color: context.colors.secondary),
                    ),
                    trailing: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icon/settings_24px.svg',
                          package: 'home',
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditProfileRoute()));
                        })),
              ),
              SizedBox(height: 20),
              Card(
                color: context.colors.primaryContainer,
                margin: EdgeInsets.zero,
                child: InkWell(
                  splashColor: context.colors.primaryContainer,
                  onTap: () {
                    debugPrint('kegiatan mendatang Tapped.');
                  },
                  child: SizedBox(
                    width: 360,
                    height: 150,
                    child: Container(
                        child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kegiatan mendatang',
                                style: context.titleLarge?.copyWith(
                                    color: context.colors.onPrimaryContainer),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Family trip',
                                style: context.titleMedium?.copyWith(
                                    color: context.colors.onPrimaryContainer),
                                textAlign: TextAlign.left,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icon/schedule.svg',
                                    package: 'home',
                                  ),
                                  Text(
                                    ' 20 November 2022',
                                    style: context.bodySmall?.copyWith(
                                        color: context.colors.onSurfaceVariant),
                                  ),
                                  Text(
                                    '. 10:00 - 13:10',
                                    style: context.bodySmall?.copyWith(
                                        color: context.colors.onSurfaceVariant),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
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
              SizedBox(height: 20),
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
                          debugPrint('Daftar tugas Tapped.');
                        },
                        child: SizedBox(
                          height: 150,
                          child: Container(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.checklist,
                                    size: 36,
                                    color: context.colors.tertiary,
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Text(
                                    'Daftar tugas',
                                    style: context.titleMedium?.copyWith(
                                        color: context.colors.onBackground),
                                  ),
                                  Text(
                                    '2 daftar',
                                    style: context.bodySmall?.copyWith(
                                        color: context.colors.onSurfaceVariant),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Card(
                      color: context.colors.surfaceVariant,
                      margin: EdgeInsets.zero,
                      child: InkWell(
                        splashColor: context.colors.surfaceVariant,
                        onTap: () {
                          debugPrint('Daftar tugas Tapped.');
                        },
                        child: SizedBox(
                          height: 150,
                          child: Container(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    size: 36,
                                    color: context.colors.primary,
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Text(
                                    'Kalender',
                                    style: context.titleMedium?.copyWith(
                                        color: context.colors.onBackground),
                                  ),
                                  Text(
                                    '10 kegiatan bulan ini',
                                    style: context.bodySmall?.copyWith(
                                        color: context.colors.onSurfaceVariant),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              SizedBox(height: 20),
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
                          debugPrint('Daftar tugas Tapped.');
                        },
                        child: SizedBox(
                          height: 150,
                          child: Container(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.event_note,
                                    size: 36,
                                    color: context.customColors?.green,
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Text(
                                    'Kegiatan',
                                    style: context.titleMedium?.copyWith(
                                        color: context.colors.onBackground),
                                  ),
                                  Text(
                                    '10 kegiatan',
                                    style: context.bodySmall?.copyWith(
                                        color: context.colors.onSurfaceVariant),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Card(
                      color: context.colors.surfaceVariant,
                      margin: EdgeInsets.zero,
                      child: InkWell(
                        splashColor: context.colors.surfaceVariant,
                        onTap: () {
                          debugPrint('Daftar tugas Tapped.');
                        },
                        child: SizedBox(
                          height: 150,
                          child: Container(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.house_outlined,
                                    size: 36,
                                    color: context.customColors?.purple,
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Text(
                                    'Keluarga Ahmad',
                                    style: context.titleMedium?.copyWith(
                                        color: context.colors.onBackground),
                                  ),
                                  Text(
                                    '6 orang',
                                    style: context.bodySmall?.copyWith(
                                        color: context.colors.onSurfaceVariant),
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
      ),
    );
  }
}

enum MoodUser { SangatSenang, Senang, BiasaSaja, TidakSenang, Sakit }

class EditProfileRoute extends StatefulWidget {
  const EditProfileRoute({super.key});

  @override
  State<EditProfileRoute> createState() => _EditProfileRouteState();
}

class _EditProfileRouteState extends State<EditProfileRoute> {
  MoodUser? _moodUser = MoodUser.SangatSenang;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profil'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.check))],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          SvgPicture.asset(
            'assets/image/Group 6.svg',
            package: 'home',
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text('Nama'),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: context.colors.onSurfaceVariant,
                ),
                tooltip: 'Delete',
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text('Tanggal ulang tahun'),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.today,
                  color: context.colors.onSurfaceVariant,
                ),
                tooltip: 'Delete',
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text('Status'),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: context.colors.onSurfaceVariant,
                ),
                tooltip: 'Delete',
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text('Mood'),
              suffixIcon: IconButton(
                icon: SvgPicture.asset(
                  'assets/icon/add_reaction.svg',
                  package: 'home',
                  color: context.colors.onSurfaceVariant,
                ),
                tooltip: 'Delete',
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(builder: (context, setState) {
                        return AlertDialog(
                          title: Text("Pilih mood Anda",
                              style: context.titleLarge?.copyWith(
                                  color: context.colors.onSurfaceVariant)),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: Row(children: [
                                  SvgPicture.asset(
                                    'assets/icon/sentiment_very_satisfied.svg',
                                    package: 'home',
                                  ),
                                  Text(
                                    ' Sangat Senang',
                                    style: context.bodySmall?.copyWith(
                                        color: context.colors.onSurfaceVariant),
                                  )
                                ]),
                                leading: Radio(
                                  value: MoodUser.SangatSenang,
                                  groupValue: _moodUser,
                                  onChanged: (MoodUser? value) {
                                    setState(() {
                                      _moodUser = value;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Row(children: [
                                  SvgPicture.asset(
                                    'assets/icon/sentiment_satisfied.svg',
                                    package: 'home',
                                  ),
                                  Text(
                                    ' Senang',
                                    style: context.bodySmall?.copyWith(
                                        color: context.colors.onSurfaceVariant),
                                  )
                                ]),
                                leading: Container(
                                  child: Radio(
                                    value: MoodUser.BiasaSaja,
                                    groupValue: _moodUser,
                                    onChanged: (MoodUser? value) {
                                      setState(() {
                                        _moodUser = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Row(children: [
                                  SvgPicture.asset(
                                    'assets/icon/sentiment_neutral.svg',
                                    package: 'home',
                                  ),
                                  Text(
                                    ' Biasa aja',
                                    style: context.bodySmall?.copyWith(
                                        color: context.colors.onSurfaceVariant),
                                  )
                                ]),
                                leading: Radio(
                                  value: MoodUser.TidakSenang,
                                  groupValue: _moodUser,
                                  onChanged: (MoodUser? value) {
                                    setState(() {
                                      _moodUser = value;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Row(children: [
                                  SvgPicture.asset(
                                    'assets/icon/sentiment_dissatisfied.svg',
                                    package: 'home',
                                  ),
                                  Text(
                                    ' Tidak senang',
                                    style: context.bodySmall?.copyWith(
                                        color: context.colors.onSurfaceVariant),
                                  )
                                ]),
                                leading: Radio(
                                  value: MoodUser.Senang,
                                  groupValue: _moodUser,
                                  onChanged: (MoodUser? value) {
                                    setState(() {
                                      _moodUser = value;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Row(children: [
                                  SvgPicture.asset(
                                    'assets/icon/sick.svg',
                                    package: 'home',
                                  ),
                                  Text(
                                    ' Sakit',
                                    style: context.bodySmall?.copyWith(
                                        color: context.colors.onSurfaceVariant),
                                  )
                                ]),
                                leading: Radio(
                                  value: MoodUser.Sakit,
                                  groupValue: _moodUser,
                                  onChanged: (MoodUser? value) {
                                    setState(() {
                                      _moodUser = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: Text('Cancel',
                                  style: context.bodyMedium?.copyWith(
                                      color: context.colors.primary)),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: Text(
                                'OK',
                                style: context.bodyMedium
                                    ?.copyWith(color: context.colors.primary),
                              ),
                            ),
                          ],
                        );
                      });
                    }),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
