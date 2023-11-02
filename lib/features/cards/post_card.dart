import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unsoedfess/features/post/post.dart';
import 'package:unsoedfess/features/profile/profile.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    super.key,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool _isLiked = false;
  void _like() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 0.5))),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) => const PostPage()));
        },
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context, CupertinoPageRoute(builder: (context) => const ProfilePage()));
                      },
                      child: const CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(
                              'https://berita.yodu.id/wp-content/uploads/2023/02/profil-onic-kayes.jpg')),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Row(
                                children: [
                                  Text('felicia.angel__',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  Text('  ∙ 18m',
                                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                                ],
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {},
                                child: const Icon(
                                  FluentIcons.more_horizontal_32_filled,
                                  size: 22,
                                ),
                              )
                            ],
                          ),
                          const Text(
                            'Baru selesai nonton ice cold, makin besar kemungkinan bukan Jesicca yang membunuh Mirna. Sepertinya \n "Ada sutradara dibalik kasus ini"',
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 4),

                          // const ImageCarousel(),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              InkWell(
                                  onTap: _like,
                                  splashColor: Colors.transparent,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      _isLiked
                                          ? Icon(FluentIcons.heart_16_filled,
                                              color: Colors.red.shade500)
                                          : const Icon(
                                              FluentIcons.heart_16_regular,
                                              size: 24,
                                            ),
                                      const Text('239')
                                    ],
                                  )),
                              const SizedBox(width: 24),
                              InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.push(context,
                                        CupertinoPageRoute(builder: (context) => const PostPage()));
                                  },
                                  child: const Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Icon(FluentIcons.chat_16_regular, size: 24),
                                        Text('12')
                                      ])),
                              const SizedBox(width: 24),
                              InkWell(
                                  onTap: () {},
                                  child: const Row(
                                    children: [
                                      Icon(FluentIcons.arrow_repeat_all_16_regular, size: 24),
                                      Text('4')
                                    ],
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
