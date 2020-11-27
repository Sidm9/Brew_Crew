import 'package:brew_crew/modals/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // THE MAIN THING!!!!!
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user object based on firebase
  User _userFromFirebaseUser(FirebaseUser user) {
    // PASSES THE UID OF ANON USER TO THE USER CLASS
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change User stream
  // THIS WILL DETECT CHANGES WETHER USER IS SIGNED IN OR NOT

  Stream<User> get user {
    return _auth.onAuthStateChanged
        // Maps the data coming from firebase (AUTH CHANGES) to our own USER class
        // that is own user class
        .map(_userFromFirebaseUser);
  }

  // Sign in Anon method
  Future signInAnon() async {
    try {
      // INSTANTIATES THE OBJECT FROM THE FIREBASE INBUILT FUNCTION
      AuthResult result = await _auth.signInAnonymously();
      // GETS DATA FROM THE FIREBASE ABOUT THE ANON USER
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with creds method

  // register with email and password

  // Sign out method
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
