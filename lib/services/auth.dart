import 'package:brew_crew/modals/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user object based on firebase
  User _userFromFirebase(FirebaseUser user) {
    // PASSES THE UID OF ANON USER TO THE USER CLASS
    return user != null ? User(uid: user.uid) : null;
  }

  // Sign in Anon
  Future signInAnon() async {
    try {
      // INSTANTIATES THE OBJECT FROM THE FIREBASE INBUILT FUNCTION
      AuthResult result = await _auth.signInAnonymously();
      // GETS DATA FROM THE FIREBASE ABOUT THE ANON USER
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with creds

  // register with email and password

  // Sign out method

}
