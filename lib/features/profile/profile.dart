import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:unsoedfess/features/auth/models/user_model.dart';
import 'package:unsoedfess/features/cards/menfess_card.dart';
import 'package:unsoedfess/features/profile/avatar_profile.dart';
import 'package:unsoedfess/features/profile/services/profile_service.dart';

import 'follow_button.dart';
import 'message_button.dart';
import 'more_button.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
  late final TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late UserProfile _userProfile;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadProfileData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadProfileData() async {
    UserProfile? userProfile = await ProfileService.getProfileByUsername(widget.username);

    if (userProfile != null) {
      setState(() {
        _userProfile = userProfile;
      });
    } else {
      // Handle user not found
      print('User not found.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: Text(_userProfile.username,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          actions: const [MoreButton()],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                  child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
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
                                          radius: 160, avatarUrl: _userProfile.avatar)),
                                );
                              });
                        },
                        child: AvatarProfile(avatarUrl: _userProfile.avatar)),
                  ),
                  const SizedBox(height: 10),
                  Text(_userProfile.displayName,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      _userProfile.bio,
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
                            Text(_userProfile.posts.toString(),
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const Text('Posts',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(width: 30),
                        Column(
                          children: [
                            Text(_userProfile.followers.toString(),
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const Text('Followers',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(width: 30),
                        Column(
                          children: [
                            Text(_userProfile.followings.toString(),
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const Text('Following',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      children: [
                        FollowButton(),
                        SizedBox(width: 6),
                        MessageButton(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              )),
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
                  children: const [],
                ),
                const Column(children: [MenfessCard()]),
                const Column(children: [MenfessCard()])
              ]),
        )

        // ProfileInformation(),
        );
  }
}
