import 'package:firebase_auth/firebase_auth.dart';
import 'package:meditationapp/models/myuser.dart';
import 'package:meditationapp/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // creating MyUser object, filtering out un-needed info

  MyUser? _userfromFirebase(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<MyUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userfromFirebase(user!));
  }

  // sign in with email & password

  Future signInEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userfromFirebase(user!);
    } catch (e) {
      return null;
    }
  }

  // register with email and password

  Future regEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      await DatabaseService(uid: user!.uid).updateUserData('name');
      return _userfromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  // sign out

  Future signOut() async {
    try {
      // .signOut is part of Firebase, accessing it through the _auth instance
      return await _auth.signOut();
    } catch (e) {}
  }
}
