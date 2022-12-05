import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:theme/theme.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => ChangePasswordPageState();
}

class ChangePasswordPageState extends State<ChangePasswordPage> {
  late GlobalKey<FormState> formKey;

  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmNewPasswordController;

  late FocusNode oldPasswordFocusNode;
  late FocusNode newPasswordFocusNode;
  late FocusNode confirmNewPasswordFocusNode;
  late FocusNode suffixIconFocusNode;

  bool obscureOldPassword = true;
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();

    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();

    oldPasswordFocusNode = FocusNode();
    newPasswordFocusNode = FocusNode();
    confirmNewPasswordFocusNode = FocusNode();
    suffixIconFocusNode = FocusNode(skipTraversal: true);
  }

  @override
  void dispose() {
    super.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();

    oldPasswordFocusNode.dispose();
    newPasswordFocusNode.dispose();
    confirmNewPasswordFocusNode.dispose();

    suffixIconFocusNode.dispose();
  }

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
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: oldPasswordController,
                focusNode: oldPasswordFocusNode,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: const Text('Password Lama'),
                  suffixIcon: IconButton(
                    focusNode: suffixIconFocusNode,
                    icon: Icon(
                      obscureOldPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: context.colors.onSurfaceVariant,
                    ),
                    tooltip: 'Lihat',
                    onPressed: () {
                      setState(() {
                        obscureOldPassword = !obscureOldPassword;
                      });
                    },
                  ),
                ),
                obscureText: obscureOldPassword,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: newPasswordController,
                focusNode: newPasswordFocusNode,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: const Text('Password Baru'),
                  suffixIcon: IconButton(
                    focusNode: suffixIconFocusNode,
                    icon: Icon(
                      obscureNewPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: context.colors.onSurfaceVariant,
                    ),
                    tooltip: 'Lihat',
                    onPressed: () {
                      setState(() {
                        obscureNewPassword = !obscureNewPassword;
                      });
                    },
                  ),
                ),
                obscureText: obscureNewPassword,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormBuilderValidators.minLength(
                  6,
                  errorText: 'Password harus lebih dari 6 karakter.',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: confirmNewPasswordController,
                focusNode: confirmNewPasswordFocusNode,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: const Text('Konfirmasi Password Baru'),
                  suffixIcon: IconButton(
                    focusNode: suffixIconFocusNode,
                    icon: Icon(
                      obscureConfirmPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: context.colors.onSurfaceVariant,
                    ),
                    tooltip: 'Lihat',
                    onPressed: () {
                      setState(() {
                        obscureConfirmPassword = !obscureConfirmPassword;
                      });
                    },
                  ),
                ),
                obscureText: obscureConfirmPassword,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormBuilderValidators.equal(
                  newPasswordController.text,
                  errorText: 'Password tidak sama.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
