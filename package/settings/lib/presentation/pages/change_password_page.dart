import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => ChangePasswordPageState();
}

class ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Ubah Password'),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            tooltip: 'Selesai',
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: const Text('Password Lama'),
                  helperText: null,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility_outlined),
                    tooltip: 'Lihat',
                    onPressed: () {},
                  ),
                ),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (string) {
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: const Text('Password Baru'),
                  helperText: null,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility_outlined),
                    tooltip: 'Lihat',
                    onPressed: () {},
                  ),
                ),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (string) {
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: const Text('Konfirmasi Password Baru'),
                  helperText: null,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility_outlined),
                    tooltip: 'Lihat',
                    onPressed: () {},
                  ),
                ),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (string) {
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
