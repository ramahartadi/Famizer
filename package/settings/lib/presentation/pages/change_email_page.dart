import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage({super.key});

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Ubah Email'),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            tooltip: 'Selesai',
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: TextFormField(
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text('Email'),
          ),
          obscureText: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (string) {
            return null;
          },
        ),
      ),
    );
  }
}
