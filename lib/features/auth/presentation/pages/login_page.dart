import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          // icon (lock_open_rounded)
          Icon(
            Icons.lock_open_rounded,
            size: 40,
          ),
          // email textField
          // password textField
          // login button
          // text to go the register page
        ],
      ),
    );
  }
}
