import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool isUserAuthenticated = false;

  Future<bool> createUser(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<void> isLogado() async {
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user != null) {
        isUserAuthenticated = true;
      } else {
        isUserAuthenticated = false;
      }
    });
  }
}
