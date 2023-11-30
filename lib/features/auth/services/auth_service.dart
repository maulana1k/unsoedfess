import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unsoedfess/features/auth/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProfile?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Fetch additional user information from Firestore
      UserProfile? userProfile = await _getUserProfile(authResult.user?.uid ?? '');
      log('profile: ${userProfile?.toJson().toString()}');
      return userProfile;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProfile?> _getUserProfile(String uid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('users').doc(uid).get();
      log('snapshot : ${snapshot.data()}');
      if (snapshot.data() != null) {
        return UserProfile.fromJson(snapshot.data() ?? {});
      }
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  Future<void> saveUserProfile(String uid, UserProfile userProfile) async {
    try {
      log('profile: ${userProfile.toJson()}');
      await _firestore.collection('users').doc(uid).set(
            userProfile.toJson(),
          );
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProfile> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    User? user = await signUpWithEmailAndPassword(email, password);

    if (user != null) {
      UserProfile? userProfile = await _getUserProfile(user.uid);

      if (userProfile == null) {
        // If the user profile doesn't exist, create a basic profile
        userProfile = UserProfile(
          avatar: "",
          email: email,
          username: username,
          displayName: username,
          bio: "",
          followers: 0,
          followings: 0,
          posts: 0,
          token: 'token',
        );

        // Save the basic profile to Firestore
        await saveUserProfile(user.uid, userProfile);
      }

      await _saveUserData(userProfile);

      return userProfile;
    } else {
      throw Exception('Authentication failed');
    }
  }

  Future<void> _saveUserData(UserProfile userProfile) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = jsonEncode(userProfile.toJson());
    prefs.setString('userProfile', jsonData);
  }
}
