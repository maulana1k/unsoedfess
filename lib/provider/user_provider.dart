import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unsoedfess/features/auth/models/user_model.dart';

class UserData extends ChangeNotifier {
  UserProfile? _profile;

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
