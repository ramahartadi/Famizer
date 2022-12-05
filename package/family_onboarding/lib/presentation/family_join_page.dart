import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class FamilyJoinPage extends StatefulWidget {
  const FamilyJoinPage({super.key});

  @override
  State<FamilyJoinPage> createState() => _FamilyJoinPageState();
}

class _FamilyJoinPageState extends State<FamilyJoinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Gabung Keluarga'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            TextField(
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: const Text('Kode Famizer'),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.cancel_outlined),
                  tooltip: 'Hapus',
                  onPressed: () {},
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
                'Gabung',
                style: TextStyle(
                  color: context.colors.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
