import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/features/auth/presentation/pages/auth_page.dart';
import 'package:social_media_app/theme/theme_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
