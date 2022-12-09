import 'package:flutter/material.dart';
import 'package:home/model/user.dart';
import 'package:theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

enum MoodUser { SangatSenang, Senang, BiasaSaja, TidakSenang, Sakit }

class EditProfilePage extends StatefulWidget {
  EditProfilePage({super.key});
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController moodController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  @override
  void initState() {
    super.initState();
    namaController.text = userProfile.nama!;
    moodController.text = userProfile.mood.toString();
    dateController.text = userProfile.tanggalUlangTaun!;
    statusController.text = userProfile.status!;
  }

  MoodUser? _moodUser = MoodUser.SangatSenang;
  _EditProfilePageState({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profil'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              setState(() {
                var userEdit = User(
                    id: userProfile.id,
                    nama: namaController.text,
                    status: statusController.text,
                    tanggalUlangTaun: dateController.text,
                    mood: moodController.text);
                userProfile = userEdit;
              });
              Navigator.pop(context);
            },
          ),
        ],
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
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: namaController,
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
                onPressed: () {
                  namaController.clear();
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: dateController,
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
                onPressed: () async {
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
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: statusController,
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
                onPressed: () {
                  statusController.clear();
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: moodController,
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
                                    moodController.text = "Sangat Senang";
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
                                  value: MoodUser.Senang,
                                  groupValue: _moodUser,
                                  onChanged: (MoodUser? value) {
                                    setState(() {
                                      _moodUser = value;
                                      moodController.text = "Senang";
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
                                value: MoodUser.BiasaSaja,
                                groupValue: _moodUser,
                                onChanged: (MoodUser? value) {
                                  setState(() {
                                    _moodUser = value;
                                    moodController.text = "Biasa aja";
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
                                value: MoodUser.TidakSenang,
                                groupValue: _moodUser,
                                onChanged: (MoodUser? value) {
                                  setState(() {
                                    _moodUser = value;
                                    moodController.text = "Tidak senang";
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
                                    moodController.text = "Sakit";
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
