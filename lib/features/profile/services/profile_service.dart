import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unsoedfess/features/auth/models/user_model.dart';

class ProfileService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<UserProfile?> getProfileByUsername(String username) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('username', isEqualTo: username)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        print("Profile found");
        return UserProfile.fromJson(querySnapshot.docs.first.data());
      } else {
        print("Profile not found");
        return null;
      }
    } catch (error) {
      print("Error: $error");
      return null;
    }
  }
}
