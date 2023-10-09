import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:unsoedfess/components/menfess_card.dart';
import 'package:unsoedfess/components/post_card.dart';

class ActivityTabs extends StatefulWidget {
  const ActivityTabs({super.key});

  @override
  State<ActivityTabs> createState() => _ActivityTabsState();
}

class _ActivityTabsState extends State<ActivityTabs> with TickerProviderStateMixin {
  late final TabController _tabController;

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
    return SizedBox(
      height: MediaQuery.of(context).size.height - 140,
      child: Column(
        children: [
          TabBar.secondary(
              // tabAlignment: TabAlignment.center,
              indicatorColor: Colors.black,
              controller: _tabController,
              unselectedLabelColor: Colors.grey,
              // indicatorSize: TabBarIndicatorSize.label,
              dividerColor: Colors.grey.shade100,
              splashFactory: NoSplash.splashFactory,
              indicatorWeight: 1,
              tabs: const [
                Tab(child: Text('Posts', style: TextStyle(fontWeight: FontWeight.bold))),
                Tab(child: Text('Replies', style: TextStyle(fontWeight: FontWeight.bold))),
                Tab(child: Text('Media', style: TextStyle(fontWeight: FontWeight.bold))),
              ]),
          // const SizedBox(height: 10),
          Container(
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: const <Widget>[
                  Column(
                    children: [
                      PostCard(),
                      PostCard(),
                    ],
                  ),
                  Column(
                    children: [MenfessCard()],
                  ),
                  Column(
                    children: [MenfessCard()],
                  )
                ]),
          )
        ],
      ),
    );
  }
}
