import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class AuthorisationRepository {
  Future<UserCredential> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance
          .signOut();
    } on FirebaseAuthException {
      rethrow;
    }
  }
}