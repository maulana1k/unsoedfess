import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unsoedfess/features/create_post/create_post.dart';
import 'package:unsoedfess/features/home/screens/notification.dart';

import 'package:unsoedfess/features/cards/post_card.dart';
import 'package:unsoedfess/features/cards/story_card.dart';
import 'package:unsoedfess/provider/user_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        // floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: const Icon(FluentIcons.list_16_filled),
              title: Text(ref.read(titleProvider),
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w700).copyWith(fontSize: 22)),
              actions: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (context) => const NotificationPage()));
                      },
                      icon: const Badge(
                        // label: Text('5'),
                        smallSize: 10,
                        child: Icon(FluentIcons.alert_12_regular, size: 28),
                      ),
                    ))
              ],
              // forceElevated: innerBoxIsScrolled,
            ),
          ];
        },
        body: RefreshIndicator(
          color: Colors.black,
          onRefresh: () {
            return Future.delayed(const Duration(seconds: 2));
          },
          child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0),
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: StoryList(),
                ),
                Divider(thickness: 0.5),
                PostCard(),
                // MenfessCard(),
                // PostCard(),
                // PostCard(),
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        elevation: 12,
        onPressed: () {
          Navigator.push(context, SlideUpPageRoute(page: const CreatePost()));
        },
        child: const Icon(FluentIcons.add_16_filled, color: Colors.white),
      ),
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

class SlideUpPageRoute extends PageRouteBuilder {
  final Widget page;

  SlideUpPageRoute({required this.page})
      : super(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0, 1);
            const end = Offset.zero;
            const curve = Curves.easeOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        );
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
