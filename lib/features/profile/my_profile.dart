import 'dart:ui';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unsoedfess/features/auth/models/user_model.dart';
import 'package:unsoedfess/features/option/option.dart';
import 'package:unsoedfess/features/profile/avatar_profile.dart';
import 'package:unsoedfess/features/profile/edit_profile.dart';
import 'package:unsoedfess/provider/user_provider.dart';

class MyProfilePage extends ConsumerStatefulWidget {
  const MyProfilePage({super.key});

  @override
  ConsumerState<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends ConsumerState<MyProfilePage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    ref.read(userProvider);
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(userProvider).profile;
    if (profile == null) {
      return const Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: Text(profile.username,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Option(),
                  ),
                );
              },
              icon: const Icon(FluentIcons.settings_16_regular, size: 28),
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: buildProfileInformation(profile),
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
                      Tab(
                          child: Text('Posts',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Tab(
                          child: Text('Replies',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Tab(
                          child: Text('Media',
                              style: TextStyle(fontWeight: FontWeight.bold))),
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
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'No Posts Yet',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ),
                      ),
                    ]),
                ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'No Posts Yet',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ),
                      ),
                    ]),
                ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'No Posts Yet',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ),
                      ),
                    ]),
              ]),
        ));
  }

  Widget buildProfileInformation(UserProfile profile) {
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
                      filter: ImageFilter.blur(
                          sigmaX: 8, sigmaY: 8, tileMode: TileMode.mirror),
                      child: Center(
                        child: AvatarProfile(
                          radius: 160,
                          avatarUrl: profile.avatar,
                        ),
                      ),
                    );
                  });
            },
            child: AvatarProfile(avatarUrl: profile.avatar),
          ),
        ),
        const SizedBox(height: 10),
        Text(profile.displayName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            profile.bio,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 12),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('${profile.posts}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const Text('Posts',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                children: [
                  Text('${profile.followers}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const Text('Followers',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                children: [
                  Text('${profile.followings}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const Text('Followings',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const EditProfile()));
                },
                style: ButtonStyle(
                    visualDensity: VisualDensity.compact,
                    side: MaterialStateProperty.all(BorderSide.none),
                    overlayColor:
                        MaterialStateProperty.all(Colors.grey.shade400),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.grey.shade200)),
                child: const Text('Edit Profile',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center)),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
