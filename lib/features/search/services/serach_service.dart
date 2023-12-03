import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unsoedfess/features/auth/models/user_model.dart';

class SearchService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<UserProfile>> findUsersByUsername(String searchTerm) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('username', isGreaterThanOrEqualTo: searchTerm)
          .where('username', isLessThan: '${searchTerm}z')
          .get();
      print(querySnapshot.docs.length);
      return querySnapshot.docs.map((e) => UserProfile.fromJson(e.data())).toList();
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
