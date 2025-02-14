import 'package:social_media_app/features/auth/domain/entities/app_user.dart';

// -------------------------------- AUTH STATES -------------------------------

abstract class AuthStates {}

// initial
class AuthInitial extends AuthStates {}

// loading
class AuthLoading extends AuthStates {}

// authenticated
class AuthAuthenticated extends AuthStates {
  final AppUser user;
  AuthAuthenticated(this.user);
}

// unauthenticated
class AuthUnAuthenticated extends AuthStates {}

// errors
class AuthErrors extends AuthStates {
  final String message;
  AuthErrors(this.message);
}
