import 'package:authentication/presentation/cubits/signup/signup_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:theme/theme.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;

  late FocusNode suffixIconFocusNode;

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
    suffixIconFocusNode = FocusNode(skipTraversal: true);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    suffixIconFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Text(
              'Famizer',
              style:
                  context.titleSmall?.copyWith(color: context.colors.primary),
            ),
            Expanded(
              child: Form(
                key: formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Sign up',
                          style: context.displaySmall?.copyWith(
                            color: context.colors.primary,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: emailController,
                          focusNode: emailFocusNode,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            label: const Text('Email'),
                            suffixIcon: IconButton(
                              focusNode: suffixIconFocusNode,
                              icon: Icon(
                                Icons.cancel_outlined,
                                color: context.colors.onSurfaceVariant,
                              ),
                              tooltip: 'Hapus',
                              onPressed: () {
                                emailController.clear();
                              },
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.email(
                              errorText: 'Masukan Email yang benar.'),
                          onChanged: (value) {
                            context.read<SignupCubit>().emailChanged(value);
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            label: const Text('Password'),
                            suffixIcon: IconButton(
                              focusNode: suffixIconFocusNode,
                              icon: Icon(
                                obscurePassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: context.colors.onSurfaceVariant,
                              ),
                              tooltip: 'Lihat',
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                            ),
                          ),
                          obscureText: obscurePassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.minLength(
                            6,
                            errorText: 'Password harus lebih dari 6 karakter.',
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: confirmPasswordController,
                          focusNode: confirmPasswordFocusNode,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            label: const Text('Konfirmasi Password'),
                            suffixIcon: IconButton(
                              icon: Icon(
                                obscureConfirmPassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: context.colors.onSurfaceVariant,
                              ),
                              tooltip: 'Delete',
                              onPressed: () {
                                setState(() {
                                  obscureConfirmPassword =
                                      !obscureConfirmPassword;
                                });
                              },
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.equal(
                            passwordController.text,
                            errorText: 'Password tidak sama.',
                          ),
                          obscureText: obscureConfirmPassword,
                          onChanged: (value) {
                            context.read<SignupCubit>().passwordChanged(value);
                          },
                        ),
                        const SizedBox(height: 20),
                        BlocBuilder<SignupCubit, SignupState>(
                          buildWhen: (previous, current) {
                            return previous.status != current.status;
                          },
                          builder: (context, state) {
                            return state.status == SignupStatus.submitting
                                ? ElevatedButton(
                                    child: const CircularProgressIndicator(),
                                    onPressed: () {},
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: context.colors.primary,
                                      elevation: 0,
                                    ),
                                    child: Text(
                                      'Sign up',
                                      style: TextStyle(
                                          color: context.colors.onPrimary),
                                    ),
                                    onPressed: () async {
                                      final bool isValid =
                                          formKey.currentState!.validate();
                                      if (!isValid) return;
                                      try {
                                        await context
                                            .read<SignupCubit>()
                                            .signupFormSubmitted();
                                        Future.delayed(
                                          const Duration(seconds: 1),
                                          () {
                                            context
                                                .goNamed('profileRegistration');
                                          },
                                        );
                                      } on FirebaseAuthException catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              e.toString(),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  );
                          },
                        ),
                        const SizedBox(height: 20),
                        RichText(
                          text: TextSpan(
                            text: 'Sudah mempunyai akun?',
                            style: context.labelMedium?.copyWith(
                              color: context.colors.onBackground,
                            ),
                            children: [
                              TextSpan(
                                  text: ' Sign in',
                                  style: context.labelMedium?.copyWith(
                                    color: context.colors.primary,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.pop();
                                    }),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
