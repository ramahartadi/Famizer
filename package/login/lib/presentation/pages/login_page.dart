import 'package:authentication/presentation/cubits/cubits.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme/theme.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;

  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Welcome!',
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
                        icon: Icon(
                          Icons.cancel_outlined,
                          color: context.colors.onSurfaceVariant,
                        ),
                        tooltip: 'Delete',
                        onPressed: () {
                          emailController.clear();
                        },
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.always,
                    validator: FormBuilderValidators.email(
                        errorText: 'Masukan Email yang benar.'),
                    onChanged: (value) {
                      context.read<LoginCubit>().emailChanged(value);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: const Text('Password'),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: context.colors.onSurfaceVariant,
                        ),
                        tooltip: 'Delete',
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),
                    ),
                    obscureText: obscurePassword,
                    onChanged: (value) {
                      context.read<LoginCubit>().passwordChanged(value);
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<LoginCubit, LoginState>(
                    buildWhen: (previous, current) =>
                        previous.status != current.status,
                    builder: (context, state) {
                      return state.status == LoginStatus.submitting
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: context.colors.primary,
                              ),
                              onPressed: () {},
                              child: CircularProgressIndicator(
                                color: context.colors.onPrimary,
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                context
                                    .read<LoginCubit>()
                                    .logInWithCredentials();
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: context.colors.primary,
                              ),
                              child: Text(
                                'Sign in',
                                style:
                                    TextStyle(color: context.colors.onPrimary),
                              ),
                            );
                    },
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: 'Belum mempunyai akun?',
                      style: context.labelMedium?.copyWith(
                        color: context.colors.onBackground,
                      ),
                      children: [
                        TextSpan(
                            text: ' Sign up',
                            style: context.labelMedium?.copyWith(
                              color: context.colors.primary,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.goNamed('signup');
                              })
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
