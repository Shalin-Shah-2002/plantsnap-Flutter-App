import 'package:firebase_auth/firebase_auth.dart';

class Authantication {
  final FirebaseAuth _authentication = FirebaseAuth.instance;
  User? get currentuser => _authentication.currentUser;
  Stream<User?> get userstatechange => _authentication.authStateChanges();

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _authentication.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword(
      {required String name,
      required String email,
      required String password}) async {
    await _authentication.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await _authentication.signOut();
  }
}
