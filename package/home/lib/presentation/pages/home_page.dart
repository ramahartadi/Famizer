import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../model/user.dart';

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
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: ListTile(
                      leading: const FlutterLogo(size: 40),
                      title: Text(
                        '${userProfile.nama}',
                        style: context.titleSmall
                            ?.copyWith(color: context.colors.onBackground),
                      ),
                      subtitle: Text(
                        '${userProfile.status}',
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EditProfilePage())).then((value) {
                              setState(() {});
                            });
                          })),
                ),
                const SizedBox(height: 20),
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
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kegiatan mendatang',
                                  style: context.titleLarge?.copyWith(
                                      color: context.colors.onPrimaryContainer),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(
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
                                          color:
                                              context.colors.onSurfaceVariant),
                                    ),
                                    Text(
                                      '. 10:00 - 13:10',
                                      style: context.bodySmall?.copyWith(
                                          color:
                                              context.colors.onSurfaceVariant),
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
                            debugPrint('Daftar tugas Tapped.');
                          },
                          child: SizedBox(
                            height: 150,
                            child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    Text(
                                      '2 daftar',
                                      style: context.bodySmall?.copyWith(
                                          color:
                                              context.colors.onSurfaceVariant),
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
                            debugPrint('Kalender Tapped.');
                          },
                          child: SizedBox(
                            height: 150,
                            child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      size: 36,
                                      color: context.colors.primary,
                                    ),
                                    const SizedBox(
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
                                          color:
                                              context.colors.onSurfaceVariant),
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
                            debugPrint('Kegiatan Tapped.');
                          },
                          child: SizedBox(
                            height: 150,
                            child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    Text(
                                      '10 kegiatan',
                                      style: context.bodySmall?.copyWith(
                                          color:
                                              context.colors.onSurfaceVariant),
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
                            debugPrint('Keluarga Tapped.');
                          },
                          child: SizedBox(
                            height: 150,
                            child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      'Keluarga Ahmad',
                                      style: context.titleMedium?.copyWith(
                                          color: context.colors.onBackground),
                                    ),
                                    Text(
                                      '6 orang',
                                      style: context.bodySmall?.copyWith(
                                          color:
                                              context.colors.onSurfaceVariant),
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
      ),
    );
  }
}
