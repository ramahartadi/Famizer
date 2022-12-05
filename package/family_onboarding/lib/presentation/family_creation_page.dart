import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class FamilyCreationPage extends StatefulWidget {
  const FamilyCreationPage({super.key});

  @override
  State<FamilyCreationPage> createState() => _FamilyCreationPageState();
}

class _FamilyCreationPageState extends State<FamilyCreationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back',
          onPressed: () {},
        ),
        title: const Text('Membuat keluarga'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: context.colors.primaryContainer,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: -16,
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
            const SizedBox(height: 40),
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
                'Buat',
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
