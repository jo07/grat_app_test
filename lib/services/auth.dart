import 'package:google_sign_in/google_sign_in.dart';
import 'package:grat_app/models/grat_user.dart';
import 'package:grat_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  GratUser _gratUserFromUser(User user) {
    return user !=null? GratUser(uid: user.uid) : null;
  }
  // auth change user stream
  Stream<GratUser> get user {
    return _auth.authStateChanges()
        .map(_gratUserFromUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _gratUserFromUser(user);

    } catch (e) {
      print(e.toString());
      return null;

    }
  }
  // sign in with email and password

  //register with email and password

  // sign out
  Future signOut() async{
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  Future createUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      // await DatabaseService(uid: user.uid).updateUserData('0', 'new crew member', 100);
      return _gratUserFromUser(user);

    } catch (e){
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _gratUserFromUser(user);

    } catch (e){
      print(e.toString());
      return null;
    }
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    try {
      UserCredential result = await _auth.signInWithCredential(credential);
      User user = result.user;
      return _gratUserFromUser(user);

    } catch (e){
      print(e.toString());
      return null;
    }
  }

}