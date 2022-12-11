import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:signup/presentation/bloc/create_new_user_bloc.dart';
import 'package:theme/theme.dart';

class ProfileRegistration extends StatefulWidget {
  const ProfileRegistration({super.key});

  @override
  State<ProfileRegistration> createState() => _ProfileRegistrationState();
}

class _ProfileRegistrationState extends State<ProfileRegistration> {
  late TextEditingController nameController;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late User? user;
  late String? uid;
  late String? email;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    user = firebaseAuth.currentUser;
    uid = user?.uid;
    email = user?.email;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: const Text('Nama'),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.cancel_outlined),
                  tooltip: 'Hapus',
                  onPressed: () {},
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: FormBuilderValidators.required(
                  errorText: 'Bidang ini tidak boleh kosong.'),
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
              onPressed: () {
                context
                    .read<CreateNewUserBloc>()
                    .add(Create(uid!, nameController.text, email!));
              },
            ),
          ],
        ),
      ),
    );
  }
}
