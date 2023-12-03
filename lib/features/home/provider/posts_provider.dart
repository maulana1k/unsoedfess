import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unsoedfess/features/home/models/post_model.dart';

class PostsProvider extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<PostModel> homePosts = [];
  PostsProvider() {
    homePosts = [
      // PostModel(
      //     userID: '2',
      //     author: Author(
      //         username: 'free.palestine',
      //         avatarUrl:
      //             'https://akcdn.detik.net.id/visual/2020/09/12/bendera-palestina_169.jpeg?w=650&q=90',
      //         displayName: 'StandWithPalestine'),
      //     content:
      //         'please don’t stop talking about palestine !!! your silence and comfort is a privilege. pls remember that the people in palestine do not get a break and they are currently and actively having to live through this everyday. use your voice and platform!',
      //     media: [],
      //     timestamp: DateTime.now(),
      //     likes: 912,
      //     replies: 131,
      //     reposts: 63),
      // PostModel(
      //     userID: '1',
      //     author: Author(
      //         username: 'felicia.angel',
      //         avatarUrl: 'https://berita.yodu.id/wp-content/uploads/2023/02/profil-onic-kayes.jpg',
      //         displayName: 'Felicia Angelique'),
      //     content:
      //         'Baru selesai nonton ice cold, makin besar kemungkinan bukan Jesicca yang membunuh Mirna. Sepertinya \n "Ada sutradara dibalik kasus ini"',
      //     media: [
      //       'https://assets.ayobandung.com/crop/0x0:0x0/750x500/webp/photo/p1/844/2023/10/06/Snapinstaapp_383228145_633134392274377_6755131242156320552_n_1080-1-3871558868.jpg'
      //     ],
      //     timestamp: DateTime.now(),
      //     likes: 450,
      //     replies: 20,
      //     reposts: 0)
    ];
  }
  Future<void> getPosts(int pageSize) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .collection('posts')
          .orderBy('timestamp', descending: true)
          .limit(pageSize)
          .get();
      print(querySnapshot);
      if (pageSize == 1) {
        homePosts.clear();
      }

      // Iterate through the documents
      final List<PostModel> posts = [];
      for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot in querySnapshot.docs) {
        // Access data using documentSnapshot.data()
        Map<String, dynamic> data = documentSnapshot.data();
        // Create a PostModel object from the data and add it to the list
        print(data);
        PostModel post = PostModel.fromJson(data);
        posts.add(post);
      }
      homePosts = posts;
      notifyListeners();
    } catch (e) {
      print('Error fetching posts: $e');
      // Handle the error as needed
    }
  }
}

final postsProvider = ChangeNotifierProvider<PostsProvider>((ref) => PostsProvider());
