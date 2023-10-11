import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:unsoedfess/components/post_card.dart';

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
          height: 40,
          decoration:
              BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
          child: const TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(FluentIcons.search_12_regular, size: 20),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                hintText: "Search",
                hintStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
      ),
      body: RefreshIndicator(
        color: Colors.black,
        strokeWidth: 2,
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Hashtags',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                    children: List.generate(3, (index) {
                  return const HashtagTile(tag: '#SeptemberHitam', count: '2.6k');
                })),
                const HashtagTile(tag: '#Termobarik', count: '42.1k'),
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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
            // const Icon(FluentIcons.number_symbol_24_filled, size: 18),
            // const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tag, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('• $count Posts',
                    style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.blue))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
