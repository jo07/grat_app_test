import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grat_app/models/grat_user.dart';
import 'package:google_sign_in/google_sign_in.dart';


class DatabaseService {
  // collection reference
  final String uid;
  DatabaseService({this.uid});

  // final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  // Future updateUserData(String sugar, String name, int strength) async {
  //   return await brewCollection.doc(uid).set({
  //     'sugars' : sugar,
  //     'name' : name,
  //     'strength' : strength,
  //   });
  // }

  // List<Brew> _brewListFromSnapshot (QuerySnapshot snapshot){
  //   return snapshot.docs.map((doc) {
  //     return Brew(
  //       name: doc.get('name') ?? '',
  //       strength: doc.get('strength') ?? 0,
  //       sugars: doc.get('sugars') ?? '0',
  //     );
  //   }).toList();
  // }

  // to get brews stream
  // Stream<List<Brew>> get brews {
  //   return brewCollection.snapshots()
  //       .map(_brewListFromSnapshot);
  // }

  // user data from snapshot
//   GratUserData _customerUserDataFromSnapshot(DocumentSnapshot snapshot){
//     return GratUserData(
//       uid: uid,
//       name: snapshot.get('name'),
//       sugars: snapshot.get('sugars'),
//       strength: snapshot.get('strength'),
//     );
//   }
//
//   // get user doc stream
//   Stream<CustomUserData> get customUserData {
//     return brewCollection.doc(uid).snapshots().map(_customerUserDataFromSnapshot);
//   }


  Future<UserCredential> signInWithGoogle() async {
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
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
 }