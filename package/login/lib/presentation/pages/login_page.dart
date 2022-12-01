import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: context.colors.primary,
                    ),
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: context.colors.onPrimary),
                    ),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    child: const Text('Sign in with Google'),
                    onPressed: () {},
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
                        )
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
