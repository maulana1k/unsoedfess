import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unsoedfess/features/auth/models/user_model.dart';

class UserData extends ChangeNotifier {
  UserProfile? _profile = UserProfile(
      email: '',
      avatar:
          'https://image.popbela.com/content-images/post/20220506/2-7-2ddb8ff7827782237c7e276320be3b08.jpg?width=750&format=webp&w=750',
      username: 'steph.str',
      displayName: 'Stephen Strange',
      bio: 'Whooz',
      password: '',
      followers: 0,
      followings: 0,
      posts: 0);

  UserProfile? get profile => _profile;

  void setUserData({required UserProfile profile}) {
    _profile = profile;
    notifyListeners();
  }

  bool get isLoggedIn => _profile != null;

  void logout() {
    _profile = null;
  }
}

final userProvider = ChangeNotifierProvider<UserData>((ref) => UserData());
final titleProvider = StateProvider((ref) => 'Unsoedfest');
