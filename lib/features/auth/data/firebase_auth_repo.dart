import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_app/features/auth/domain/entities/app_user.dart';
import 'package:social_media_app/features/auth/domain/repository/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  // get an instance of firebase database
  final firebaseAuth = FirebaseAuth.instance;

  // login method
  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try {
      // attempt sign in
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      // create the user
      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: '',
      );
      // return the user
      return user;
    } catch (e) {
      throw Exception("Login failed : $e");
    }
  }

  // register method
  @override
  Future<AppUser?> registerWithEmailPassword(
      String name, String email, String password) async {
    try {
      // attempt sign up
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // create the user
      AppUser user =
          AppUser(uid: userCredential.user!.uid, email: email, name: name);
      // return the user
      return user;
    } catch (e) {
      throw Exception("Registration failed : $e");
    }
  }

  // get current user method
  @override
  Future<AppUser?> getCurrentUser() async {
    final currentUser = firebaseAuth.currentUser;
    if (currentUser == null) {
      return null;
    }
    return AppUser(uid: currentUser.uid, email: currentUser.email!, name: '');
  }

  // logout method
  @override
  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }
}
