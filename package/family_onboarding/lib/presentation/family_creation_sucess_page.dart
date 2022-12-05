import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class FamilyCreationSuccessPage extends StatefulWidget {
  const FamilyCreationSuccessPage({super.key});

  @override
  State<FamilyCreationSuccessPage> createState() =>
      _FamilyCreationSuccessPageState();
}

class _FamilyCreationSuccessPageState extends State<FamilyCreationSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: context.colors.primaryContainer,
              child: Icon(
                Icons.check,
                size: 48,
                color: context.colors.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Selamat!',
              style: context.displaySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Kamu telah berhasil membuat keluarga baru di famizer. Silahkan salin kode berikut dan bagikan kepada keluarga Anda,',
              style: context.bodyLarge?.copyWith(
                color: context.colors.onBackground,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              textInputAction: TextInputAction.done,
              readOnly: true,
              // enabled: false,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: const Text('Kode Famizer'),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: context.colors.outline,
                )),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.copy),
                  tooltip: 'Copy',
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
