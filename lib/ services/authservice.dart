import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/usermodel.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account != null) {
        final userModel = UserModel.fromGoogleSignInAccount(account);
        await _firestore.collection('users').doc(userModel.id).set(
          userModel.toJson(),
          SetOptions(merge: true), 
        );

        return userModel;
      }
    } catch (e) {
      print("Sign-in error: $e");
    }
    return null;
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }

  Future<UserModel?> fetchUser(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        return UserModel.fromJson(doc.data()!);
      }
    } catch (e) {
      print("Fetch user error: $e");
    }
    return null;
  }
}
