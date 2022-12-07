import 'package:flutter/material.dart';
import 'package:home/model/user.dart';
import 'package:theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum MoodUser { SangatSenang, Senang, BiasaSaja, TidakSenang, Sakit }

class EditProfilePage extends StatefulWidget {
  EditProfilePage({super.key});
  final userProfile = User.userProfile();
  @override
  State<EditProfilePage> createState() =>
      _EditProfilePageState(userProfile: userProfile);
}

class _EditProfilePageState extends State<EditProfilePage> {
  MoodUser? _moodUser = MoodUser.SangatSenang;
  final User userProfile;
  _EditProfilePageState({Key? key, required this.userProfile});

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
          Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  'assets/image/Userimage.jpg',
                  package: 'home',
                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: ((builder) => bottomsheet()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.colors.primary),
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        color: context.colors.onPrimary,
                      ),
                    ),
                  ))
            ],
          ),
          // SvgPicture.asset(
          //   'assets/image/Group 6.svg',
          //   package: 'home',
          // ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            initialValue: userProfile.nama,
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
            initialValue: userProfile.tanggalUlangTaun,
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
            initialValue: userProfile.status,
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
            initialValue: userProfile.mood.toString(),
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
                                style: context.bodyMedium
                                    ?.copyWith(color: context.colors.primary)),
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
                  },
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget bottomsheet() {
    return Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text("Pilih gambar"),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [Icon(Icons.camera), Text("Kamera")],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [Icon(Icons.image), Text("Galeri")],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
