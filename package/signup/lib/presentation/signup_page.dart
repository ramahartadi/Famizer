import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
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
                key: _formKey,
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
                          onPressed: () {},
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: const Text('Password'),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.visibility,
                            color: context.colors.onSurfaceVariant,
                          ),
                          tooltip: 'Delete',
                          onPressed: () {},
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: const Text('Konfirmasi Password'),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.visibility,
                            color: context.colors.onSurfaceVariant,
                          ),
                          tooltip: 'Delete',
                          onPressed: () {},
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colors.primary,
                        elevation: 0,
                      ),
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: context.colors.onPrimary),
                      ),
                      onPressed: () {},
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
                            text: ' Sign up',
                            style: context.labelMedium?.copyWith(
                              color: context.colors.primary,
                            ),
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
