// --------------------- AUTH CUBIT : STATE MANAGEMENT -----------------------

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/auth/domain/entities/app_user.dart';
import 'package:social_media_app/features/auth/domain/repository/auth_repo.dart';
import 'package:social_media_app/features/auth/presentation/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  // we gonna check if the user is already authenticated
  void checkAuth() async {
    final AppUser? user = await authRepo.getCurrentUser();
    if (user != null) {
      _currentUser = user;
      emit(AuthAuthenticated(user));
    } else {
      emit(AuthUnAuthenticated());
    }
  }
  // get the current user
  // login with email and password
  // register with email and password
  // logout
}
