import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:unsoedfess/features/auth/models/user_model.dart';

class AuthService {
  Future<UserProfile> signin(context, {required String username, required String password}) async {
    // final body = {'username': username, 'password': password};
    // final response = await ApiService.post(AuthAPI.signin, body);
    // print(response.body);
    final userProfile = UserProfile(
      avatar: "",
      email: '',
      password: password,
      username: username,
      displayName: username,
      bio: "",
      followers: 0,
      followings: 0,
      posts: 0,
      token: 'token',
    );
    return userProfile;
  }

  Future<UserProfile> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    final userProfile = UserProfile(
      avatar: "",
      email: email,
      password: password,
      username: username,
      displayName: username,
      bio: "",
      followers: 0,
      followings: 0,
      posts: 0,
    );

    // final body = userProfile.toJson();
    // print('body: $body');

    // final response = await ApiService.post(AuthAPI.signup, body);

    // if (response.statusCode != 200) {
    //   throw "Failed to create user profile";
    // }

    // await _saveUserData(userProfile);
    return userProfile;
  }

  Future<void> _saveUserData(UserProfile userProfile) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = jsonEncode(userProfile.toJson());
    prefs.setString('userProfile', jsonData);
  }
}
