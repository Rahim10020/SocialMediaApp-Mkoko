import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/auth/data/firebase_auth_repo.dart';
import 'package:social_media_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media_app/features/auth/presentation/cubits/auth_states.dart';
import 'package:social_media_app/features/auth/presentation/pages/auth_page.dart';
import 'package:social_media_app/features/posts/presentation/pages/home_page.dart';

/*
MyApp -> Root level of our application
----------------------------------------------------------------------
Repositories: for the database
  - firebase

Bloc providers: for state management
  - auth
  - profile
  - post
  - search
  - theme

Check auth state: 
  - unauthenticated -> auth page (login/register)
  - authenticated -> home page

*/

class MyApp extends StatelessWidget {
  final authRepo = FirebaseAuthRepo();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // provide a cubit for our app
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<AuthCubit, AuthStates>(
          builder: (context, authState) {
            print(authState);
            // unauthenticated -> Login/Register
            if (authState is AuthUnAuthenticated) {
              return const AuthPage();
            }
            // authenticated -> HomePage
            if (authState is AuthAuthenticated) {
              return const HomePage();
            }
            // loading
            else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
          // listen for errors
          listener: (context, state) {
            if (state is AuthErrors) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
