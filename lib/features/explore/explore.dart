import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:unsoedfess/features/cards/post_card.dart';
import 'package:unsoedfess/features/explore/channel_card.dart';
import 'package:unsoedfess/features/explore/provider/explore_provider.dart';
import 'package:unsoedfess/features/explore/search_page.dart';

class Explore extends ConsumerStatefulWidget {
  const Explore({super.key});

  @override
  ConsumerState<Explore> createState() => _ExploreState();
}

class _ExploreState extends ConsumerState<Explore> {
  @override
  Widget build(BuildContext context) {
    final fyp = ref.read(exploreProvider).forYouPage;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration:
                BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(40)),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Iconify(Bx.search, size: 20, color: Colors.black),
                SizedBox(width: 10),
                Text('Search',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey))
              ],
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        color: Colors.black,
        onRefresh: () {
          return Future.delayed(const Duration(seconds: 2));
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HashtagTile(tag: 'StandWithPalestine', count: '42.1k'),
                const HashtagTile(tag: 'Gibran', count: '42.1k'),
                const HashtagTile(tag: 'Korut', count: '42.1k'),
                const HashtagTile(tag: 'Termobarik', count: '42.1k'),
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: const Text('Show more', style: TextStyle(color: Colors.blue))),
                ),
                Divider(thickness: 0.5, height: 0, color: Colors.grey.shade300),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      const Icon(FluentIcons.people_team_16_filled, color: Colors.blue, size: 30),
                      const SizedBox(width: 10),
                      Text('Channels',
                          style:
                              const TextStyle(fontWeight: FontWeight.w600).copyWith(fontSize: 18)),
                      const Spacer(),
                      InkWell(
                          onTap: () {},
                          child:
                              const Icon(Icons.arrow_forward_rounded, size: 20, color: Colors.grey))
                    ],
                  ),
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      ChannelCard(),
                      ChannelCard(),
                      ChannelCard(),
                      ChannelCard(),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Divider(thickness: 0.5, height: 0, color: Colors.grey.shade300),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Icon(FluentIcons.sparkle_28_filled, color: Colors.blue, size: 30),
                      SizedBox(width: 10),
                      Text('Explore', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Column(
                  children: fyp.map((post) {
                    return PostCard(postData: post);
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HashtagTile extends StatelessWidget {
  final String tag;
  final String count;

  const HashtagTile({
    super.key,
    required this.tag,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(FluentIcons.number_symbol_16_filled, size: 16),
                    Text(tag, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                Text('$count Posts',
                    style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.grey))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
