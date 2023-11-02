import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:unsoedfess/features/cards/menfess_card.dart';
import 'package:unsoedfess/features/cards/post_card.dart';

import 'follow_button.dart';
import 'message_button.dart';
import 'more_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
  late final TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: const Text('felica.angel_',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          actions: const [MoreButton()],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverToBoxAdapter(
                child: ProfileInformation(),
              ),
              SliverToBoxAdapter(
                child: TabBar.secondary(
                    indicatorColor: Colors.black,
                    controller: _tabController,
                    unselectedLabelColor: Colors.grey,
                    dividerColor: Colors.grey.shade100,
                    splashFactory: NoSplash.splashFactory,
                    indicatorWeight: 1,
                    tabs: const [
                      Tab(child: Text('Posts', style: TextStyle(fontWeight: FontWeight.bold))),
                      Tab(child: Text('Replies', style: TextStyle(fontWeight: FontWeight.bold))),
                      Tab(child: Text('Media', style: TextStyle(fontWeight: FontWeight.bold))),
                    ]),
              )
            ];
          },
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: <Widget>[
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    PostCard(),
                    PostCard(),
                  ],
                ),
                const Column(children: [MenfessCard()]),
                const Column(children: [MenfessCard()])
              ]),
        )

        // ProfileInformation(),
        );
  }
}

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            // border: Border.all(color: Colors.purple, width: 4)
          ),
          child: GestureDetector(
            onTap: () {
              showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8, tileMode: TileMode.mirror),
                      child: const Center(
                        child: CircleAvatar(
                          radius: 150,
                          backgroundImage: NetworkImage(
                              'https://berita.yodu.id/wp-content/uploads/2023/02/profil-onic-kayes.jpg'),
                        ),
                      ),
                    );
                  });
            },
            child: const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://berita.yodu.id/wp-content/uploads/2023/02/profil-onic-kayes.jpg'),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text('Felicia Angelique',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'very good very well',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 5),
        const Text('bit.ly/feliciangel', style: TextStyle(fontSize: 16, color: Colors.blue)),
        const SizedBox(height: 10),
        const IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('64', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text('Posts',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                ],
              ),
              VerticalDivider(thickness: 1, width: 50, indent: 12, endIndent: 12),
              Column(
                children: [
                  Text('1.389', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text('Follower',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                ],
              ),
              VerticalDivider(thickness: 1, width: 50, indent: 12, endIndent: 12),
              Column(
                children: [
                  Text('903', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text('Following',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              FollowButton(),
              SizedBox(width: 6),
              MessageButton(),
              // SizedBox(width: 6),
              // MoreButton(),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}