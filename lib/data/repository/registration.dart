import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class RegistrationRepository {
  Future<UserCredential> register(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException {
      rethrow;
    }
  }
}