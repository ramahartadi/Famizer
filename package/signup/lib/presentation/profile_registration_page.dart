import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theme/theme.dart';

class ProfileRegistration extends StatefulWidget {
  const ProfileRegistration({super.key});

  @override
  State<ProfileRegistration> createState() => _ProfileRegistrationState();
}

class _ProfileRegistrationState extends State<ProfileRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.center,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    backgroundColor: context.colors.primaryContainer,
                    radius: 50,
                    child: SvgPicture.asset(
                      'assets/avatar_placeholder.svg',
                      semanticsLabel: 'Avatar Placeholder',
                      package: 'signup',
                      color: context.colors.primary,
                    ),
                  ),
                  Positioned(
                    top: -15,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: context.colors.primary,
                      radius: 20,
                      child: IconButton(
                        icon: const Icon(Icons.add_a_photo_outlined),
                        tooltip: 'Add a photo',
                        onPressed: () {},
                        color: context.colors.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: const Text('Nama'),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.cancel_outlined),
                  tooltip: 'Add',
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colors.primary,
                elevation: 0,
              ),
              child: Text(
                'Konfirmasi',
                style: TextStyle(color: context.colors.onPrimary),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
