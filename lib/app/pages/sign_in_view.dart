import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextButton(onPressed: null, child: Text("Sign-In")),
      ),
    );
  }
}
