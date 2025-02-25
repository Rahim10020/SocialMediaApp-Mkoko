import 'package:flutter/material.dart';
import 'package:social_media_app/features/auth/presentation/components/my_button.dart';
import 'package:social_media_app/features/auth/presentation/components/my_text_field.dart';
import 'package:social_media_app/features/auth/presentation/pages/register_page.dart';
import 'package:social_media_app/theme/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final pswdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // icon (lock_open_rounded)
                  const Icon(
                    Icons.lock_open_rounded,
                    size: 45,
                    color: AppColors.bleu,
                  ),
                  const SizedBox(height: 30),
                  // welcome back message
                  Text(
                    "Welcome back! 😊😘",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 25),
                  // email textField
                  MyTextField(
                    controller: emailController,
                    hintText: "Email...",
                    obscureText: false,
                  ),
                  const SizedBox(height: 5),
                  // password textField
                  MyTextField(
                    controller: pswdController,
                    hintText: "Password...",
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  // login button
                  MyButton(
                    onTap: () {},
                    text: "Login",
                  ),
                  const SizedBox(height: 40),
                  // text to go the register page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        ),
                        child: const Text(
                          "Register Now!",
                          style: TextStyle(
                            color: AppColors.bleu,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
