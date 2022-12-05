import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class FamilyOnboardingPage extends StatefulWidget {
  const FamilyOnboardingPage({super.key});

  @override
  State<FamilyOnboardingPage> createState() => _FamilyOnboardingPageState();
}

class _FamilyOnboardingPageState extends State<FamilyOnboardingPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Apakah kamu mempunyai kode Famizer?',
              style: context.displaySmall?.copyWith(
                color: context.colors.primary,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(right: width / 3),
              child: Text(
                'Bergabung ke lingkaran keluarga kamu dengan kode',
                style: context.bodyLarge?.copyWith(
                  color: context.colors.onBackground,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: context.colors.primary,
              ),
              onPressed: () {},
              child: Text(
                'Punya',
                style: TextStyle(
                  color: context.colors.onPrimary,
                ),
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {},
              child: const Text(
                'Tidak punya, buat keluarga baru',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
