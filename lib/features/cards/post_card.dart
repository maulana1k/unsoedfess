import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:unsoedfess/features/cards/image_carousel.dart';
import 'package:unsoedfess/features/home/models/post_model.dart';
import 'package:unsoedfess/features/post/post.dart';
import 'package:unsoedfess/features/profile/avatar_profile.dart';
import 'package:unsoedfess/features/profile/profile.dart';

class PostCard extends StatefulWidget {
  final PostModel postData;

  const PostCard({
    super.key,
    required this.postData,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  Moment moment = Moment.now();
  bool _isLiked = false;
  void _like() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final timestamp =
        moment.from(widget.postData.timestamp, form: Abbreviation.full, dropPrefixOrSuffix: true);
    final data = widget.postData;
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200, width: 0.5))),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => PostPage(postData: data)));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
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
                                          builder: (context) => const ProfilePage()));
                                },
                                child: data.author.avatarUrl.isNotEmpty
                                    ? CircleAvatar(
                                        radius: 18,
                                        backgroundImage: NetworkImage(data.author.avatarUrl))
                                    : const AvatarPlaceholder(radius: 20),
                              ),
                              const SizedBox(width: 10),
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
                                              text: ' ‧ $timestamp',
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
                          icon: const Iconify(Bx.user_plus, size: 20, color: Colors.blue),
                        ),
                        IconButton(
                          style: const ButtonStyle(visualDensity: VisualDensity.compact),
                          onPressed: () {},
                          icon: const Icon(FluentIcons.more_horizontal_16_filled, size: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  data.content,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              const SizedBox(height: 10),
              if (data.media.isNotEmpty)
                ImageCarousel(
                  media: data.media,
                ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    InkWell(
                        onTap: _like,
                        splashColor: Colors.transparent,
                        child: Row(
                          children: [
                            _isLiked
                                ? Icon(FluentIcons.heart_16_filled,
                                    color: Colors.red.shade500, size: 24)
                                : const Icon(
                                    FluentIcons.heart_16_regular,
                                    size: 24,
                                  ),
                            Text(data.likes.toString())
                          ],
                        )),
                    const SizedBox(width: 18),
                    InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (context) => PostPage(postData: data)));
                        },
                        child: Row(children: [
                          const Icon(FluentIcons.chat_16_regular, size: 24),
                          Text(data.replies.toString())
                        ])),
                    const SizedBox(width: 18),
                    InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Icon(FluentIcons.arrow_repeat_all_16_regular, size: 24),
                            if (data.reposts > 0) Text(data.reposts.toString())
                          ],
                        )),
                    // const Spacer(),
                    // InkWell(
                    //     onTap: () {}, child: const Icon(FluentIcons.bookmark_16_regular, size: 24)),
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
