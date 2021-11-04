import 'package:firebase_auth/firebase_auth.dart';

class AuthService {


  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anao

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch(e) {
      return null;
    }
  }

  // sign in with email & password


  // register with email and password


  // sign out

}