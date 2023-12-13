import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unsoedfess/features/home/models/post_model.dart';
import 'package:unsoedfess/features/profile/avatar_profile.dart';
import 'package:unsoedfess/features/profile/profile.dart';

import '../cards/image_carousel.dart';

class PostPage extends StatefulWidget {
  final PostModel postData;
  const PostPage({super.key, required this.postData});

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
    final data = widget.postData;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text('Post',
            style: GoogleFonts.poppins(fontWeight: FontWeight.w700).copyWith(fontSize: 20)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => ProfilePage(
                                                username: data.author.username,
                                              )));
                                },
                                child: data.author.avatarUrl.isNotEmpty
                                    ? CircleAvatar(
                                        radius: 24,
                                        backgroundImage: NetworkImage(data.author.avatarUrl))
                                    : const AvatarPlaceholder(radius: 20),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(
                                        text: data.author.displayName,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: data.author.username,
                                            style:
                                                const TextStyle(color: Colors.grey, fontSize: 14),
                                          ),
                                          TextSpan(
                                              text: ' ‧ ${data.timestamp}',
                                              style: const TextStyle(
                                                  fontSize: 14, color: Colors.grey)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          style: const ButtonStyle(visualDensity: VisualDensity.compact),
                          onPressed: () {},
                          icon: const Icon(FluentIcons.more_horizontal_16_filled, size: 20),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      data.content,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (data.media.isNotEmpty) ImageCarousel(media: data.media),
                  const SizedBox(height: 12),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('12 Oct 2023 ꞏ 10.46',
                        style: TextStyle(
                          fontSize: 12,
                        )),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                Text(data.likes.toString())
                              ],
                            )),
                        // const SizedBox(width: 24),
                        InkWell(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(FluentIcons.chat_16_regular, size: 24),
                            Text(data.replies.toString())
                          ],
                        )),
                        // const SizedBox(width: 24),
                        const Icon(FluentIcons.arrow_repeat_all_16_regular, size: 24),
                        const Icon(FluentIcons.bookmark_16_regular, size: 24),
                      ],
                    ),
                  ),
                  const Divider(thickness: 0.3),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade200))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(
                      radius: 18, backgroundImage: NetworkImage('https://bit.ly/dan-abramov')),
                ),
                // const SizedBox(width: 4),
                const Expanded(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Write a reply',
                        border: OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Send',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
