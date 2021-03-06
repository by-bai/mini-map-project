import 'package:firebase_auth/firebase_auth.dart' as auth;
import '/models/user_model.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  UserObject? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return UserObject(user.uid, user.email);
  }

  Stream<UserObject?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<UserObject?> signInWithEmailAndPassword(
      String email,
      String password,
      ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(credential.user);
  }

  Future<UserObject?> createUserWithEmailAndPassword(
      String email,
      String password,
      ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(credential.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}