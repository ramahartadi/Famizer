import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage({super.key});

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  late TextEditingController emailController;
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

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
        child: Form(
          key: formKey,
          child: TextFormField(
            controller: emailController,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Email'),
            ),
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: FormBuilderValidators.email(
              errorText: 'Masukan Email yang benar.',
            ),
          ),
        ),
      ),
    );
  }
}
