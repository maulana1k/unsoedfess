import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:unsoedfess/features/cards/post_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          // height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration:
              BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(40)),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                FluentIcons.search_12_regular,
                size: 22,
                color: Colors.grey,
              ),
              SizedBox(width: 10),
              Text(
                'Search',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
              )
            ],
          ),
          // child: const TextField(
          //   decoration: InputDecoration(
          //       prefixIcon: Icon(FluentIcons.search_12_regular, size: 20),
          //       contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          //       hintText: "Search",
          //       hintStyle: TextStyle(fontSize: 15),
          //       border: OutlineInputBorder(borderSide: BorderSide.none)
          //       ),
          // ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: const Icon(FluentIcons.chevron_down_20_filled)),
                ),
                const Divider(
                  thickness: 0.5,
                  height: 0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'For You',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Column(
                  children: [
                    PostCard(),
                    PostCard(),
                    PostCard(),
                  ],
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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                    style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.blue))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
