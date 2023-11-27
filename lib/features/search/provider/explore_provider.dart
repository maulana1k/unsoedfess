import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unsoedfess/features/home/models/post_model.dart';

class ExploreProvider extends ChangeNotifier {
  List forYouPage = [];
  ExploreProvider() {
    forYouPage = [
      PostModel(
          userID: '1',
          author: Author(
              username: 'felicia.angel',
              avatarUrl: 'https://berita.yodu.id/wp-content/uploads/2023/02/profil-onic-kayes.jpg',
              displayName: 'Felicia Angelique'),
          content:
              'Baru selesai nonton ice cold, makin besar kemungkinan bukan Jesicca yang membunuh Mirna. Sepertinya \n "Ada sutradara dibalik kasus ini"',
          media: [
            Media(
                type: MediaType.image,
                fileUrl:
                    'https://assets.ayobandung.com/crop/0x0:0x0/750x500/webp/photo/p1/844/2023/10/06/Snapinstaapp_383228145_633134392274377_6755131242156320552_n_1080-1-3871558868.jpg')
          ],
          timestamp: '4 days ago',
          likes: 450,
          replies: 20,
          reposts: 0)
    ];
  }
}

final exploreProvider = ChangeNotifierProvider((ref) => ExploreProvider());
