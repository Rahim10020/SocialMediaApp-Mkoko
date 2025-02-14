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
  AppUser? get currentUser => _currentUser;
  // login with email and password
  Future<void> login(String email, String passwd) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.loginWithEmailPassword(email, passwd);
      if (user != null) {
        _currentUser = user;
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthUnAuthenticated());
      }
    } catch (e) {
      emit(AuthErrors(e.toString()));
      emit(AuthUnAuthenticated());
    }
  }

  // register with email and password
  Future<void> register(String name, String email, String passwd) async {
    try {
      emit(AuthLoading());
      final user =
          await authRepo.registerWithEmailPassword(name, email, passwd);
      if (user != null) {
        _currentUser = user;
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthUnAuthenticated());
      }
    } catch (e) {
      emit(AuthErrors(e.toString()));
      emit(AuthUnAuthenticated());
    }
  }

  // logout
  Future<void> logOut() async {
    authRepo.logOut();
    emit(AuthUnAuthenticated());
  }
}
