import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unsoedfess/features/home/provider/posts_provider.dart';
import 'package:unsoedfess/features/home/screens/activity.dart';

import 'package:unsoedfess/features/cards/post_card.dart';
import 'package:unsoedfess/features/cards/story_card.dart';
import 'package:unsoedfess/features/search/search_page.dart';
import 'package:unsoedfess/provider/user_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  Future fetchFeedPost() async {
    await ref.read(postsProvider).getPosts(10);
  }

  @override
  Widget build(BuildContext context) {
    final homePosts = ref.read(postsProvider).homePosts;
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              scrolledUnderElevation: 0,
              // leading: IconButton(onPressed: () {}, icon: const Icon(FluentIcons.list_16_filled)),
              title: Text(ref.read(titleProvider),
                  style:
                      GoogleFonts.merriweather(fontWeight: FontWeight.w900).copyWith(fontSize: 22)),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const SearchPage()));
                  },
                  icon: const Icon(FluentIcons.search_16_regular, size: 25),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context, CupertinoPageRoute(builder: (context) => const ActivityPage()));
                  },
                  icon: const Badge(
                    smallSize: 10,
                    child: Icon(FluentIcons.alert_16_regular, size: 25),
                  ),
                )
              ],
            ),
          ];
        },
        body: RefreshIndicator(
          color: Colors.black,
          onRefresh: () {
            return Future.delayed(const Duration(seconds: 2));
          },
          child: FutureBuilder(
              future: fetchFeedPost(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // While data is being fetched, show a loading indicator
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // If there's an error, display an error message
                  return Text('Error: ${snapshot.error}');
                } else if (homePosts.isEmpty) {
                  return const Text('No Posts');
                } else {
                  return ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(0),
                      children: homePosts.map((post) {
                        return PostCard(
                          postData: post,
                        );
                      }).toList());
                }
              }),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.black,
      //   shape: const CircleBorder(),
      //   elevation: 12,
      //   onPressed: () {
      //     Navigator.push(context, SlideUpPageRoute(page: const CreatePost()));
      //   },
      //   child: const Icon(FluentIcons.add_16_filled, color: Colors.white),
      // ),
    );
  }
}

class StoryList extends StatelessWidget {
  const StoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            StoryCard(),
            SizedBox(width: 14),
            StoryCard(),
            SizedBox(width: 14),
            StoryCard(isOpen: true),
            SizedBox(width: 14),
            StoryCard(isOpen: true),
            SizedBox(width: 14),
            StoryCard(isOpen: true),
          ],
        ));
  }
}

class SlideDownPageRoute extends PageRouteBuilder {
  final Widget page;

  SlideDownPageRoute({required this.page})
      : super(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0, 100);
            const end = Offset.zero;
            const curve = Curves.fastEaseInToSlowEaseOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        );
}
