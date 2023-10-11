import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

import '../components/image_carousel.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  bool _isLiked = false;
  void _like() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Post', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(
                              'https://berita.yodu.id/wp-content/uploads/2023/02/profil-onic-kayes.jpg'),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'felicia.angel__',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      FluentIcons.more_horizontal_32_filled,
                                      size: 22,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 2),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Baru selesai nonton ice cold, makin besar kemungkinan bukan Jesicca yang membunuh Mirna. Sepertinya \n "Ada sutradara dibalik kasus ini"',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 12),
                    const ImageCarousel(),
                    const SizedBox(height: 12),
                    const Text('12 Oct 2023 ꞏ 10.46',
                        style: TextStyle(
                          fontSize: 12,
                        )),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap: _like,
                            splashColor: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                _isLiked
                                    ? Icon(FluentIcons.heart_16_filled, color: Colors.red.shade500)
                                    : const Icon(
                                        FluentIcons.heart_16_regular,
                                        size: 24,
                                      ),
                                const Text('239')
                              ],
                            )),
                        // const SizedBox(width: 24),
                        const InkWell(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [Icon(FluentIcons.chat_16_regular, size: 24), Text('12')],
                        )),
                        // const SizedBox(width: 24),
                        const Icon(FluentIcons.arrow_repeat_all_16_regular, size: 24),
                        const Icon(FluentIcons.bookmark_16_regular, size: 24),
                      ],
                    ),
                    const Divider(thickness: 0.3),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade200))),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CircleAvatar(
                    radius: 14, backgroundImage: NetworkImage('https://bit.ly/dan-abramov')),
                const SizedBox(width: 4),
                const Expanded(
                  child: SizedBox(
                    height: 60,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Write a reply',
                          border: OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Send',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
