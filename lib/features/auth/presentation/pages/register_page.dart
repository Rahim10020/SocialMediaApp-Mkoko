import 'package:flutter/material.dart';
import 'package:social_media_app/features/auth/presentation/components/my_button.dart';
import 'package:social_media_app/features/auth/presentation/components/my_text_field.dart';
import 'package:social_media_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media_app/features/auth/presentation/pages/login_page.dart';
import 'package:social_media_app/theme/app_colors.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final pswdController = TextEditingController();
  final confirmPswdController = TextEditingController();

  // register method
  void register() {
    // prepare informations
    final email = emailController.text;
    final name = nameController.text;
    final paswd = pswdController.text;
    final cfpswd = confirmPswdController.text;

    final authCubit = context.read<AuthCubit>();

    if (email.isNotEmpty &&
        name.isNotEmpty &&
        paswd.isNotEmpty &&
        cfpswd.isNotEmpty) {
      // ensure password match
      if (paswd == cfpswd) {
        //
      }

      // if password don't match
      else {
        //
      }
    }

    // if not, display error message
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter all fields😏"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  // icon (lock_open_rounded)
                  const Icon(
                    Icons.lock_open_rounded,
                    size: 45,
                    color: AppColors.bleu,
                  ),
                  const SizedBox(height: 30),
                  // welcome back message
                  Text(
                    "Let's create an account for you! 😉✌️",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 25),
                  // name textField
                  MyTextField(
                    controller: nameController,
                    hintText: "Name...",
                    obscureText: false,
                  ),
                  const SizedBox(height: 5),
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
                  const SizedBox(height: 5),
                  // confirm password textField
                  MyTextField(
                    controller: confirmPswdController,
                    hintText: " Confirm password...",
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  // login button
                  MyButton(
                    onTap: register,
                    text: "Register",
                  ),
                  const SizedBox(height: 40),
                  // text to go the login page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
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
                            builder: (context) => const LoginPage(),
                          ),
                        ),
                        child: const Text(
                          "Login Now!",
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
