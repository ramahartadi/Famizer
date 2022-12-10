import 'package:authentication/presentation/blocs/app/app_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:theme/theme.dart';
import 'package:about/about.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
                  child: SvgPicture.asset(
                    'assets/avatar_placeholder.svg',
                    package: 'settings',
                    color: context.colors.onPrimaryContainer,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ahmad',
                      style: context.titleLarge?.copyWith(
                        color: context.colors.onBackground,
                      ),
                    ),
                    Text(
                      'ahmad@gmail.com',
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
                              context.pushNamed('editProfile');
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
