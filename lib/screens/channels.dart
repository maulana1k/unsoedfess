import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChannelsPage extends StatefulWidget {
  const ChannelsPage({super.key});

  @override
  State<ChannelsPage> createState() => _ChannelsPageState();
}

class _ChannelsPageState extends State<ChannelsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          // leading: const Icon(FluentIcons.people_team_32_regular),
          actions: [IconButton(onPressed: () {}, icon: const Icon(FluentIcons.search_16_filled))],
          title: Text('Menfess Channels',
              style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w800).copyWith(fontSize: 24)),
          bottom: const TabBar(
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              splashFactory: NoSplash.splashFactory,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              tabs: [
                Tab(child: Text('Explore')),
                Tab(child: Text('Joined')),
                // Tab(child: Text('Setting')),
              ]),
        ),
        body: TabBarView(children: [
          ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(FluentIcons.comment_mention_24_filled, color: Colors.black, size: 60),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        'Join the channels and send anonymous messages',
                        style: TextStyle(
                            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Popular',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    GridView.count(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      crossAxisCount: 2,
                      // childAspectRatio: 3 / 4,
                      children: List.generate(7, (index) {
                        return const ChannelCard();
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(FluentIcons.comment_mention_24_filled, color: Colors.white, size: 60),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        'Join the channels and send anonymous messages',
                        style: TextStyle(
                            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Popular Channels',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    GridView.count(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4,
                      children: List.generate(7, (index) {
                        return const ChannelCard();
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class JoinedChannel extends StatelessWidget {
  const JoinedChannel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 22),
        child: Column(children: [
          // CircleAvatar(
          //   radius: 36,
          //   backgroundImage: NetworkImage(
          //       'https://akcdn.detik.net.id/community/media/visual/2022/01/11/kampus-itb.png?w=700&q=90'),
          // ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://akcdn.detik.net.id/community/media/visual/2022/01/11/kampus-itb.png?w=700&q=90'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Teknik Base',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          )
        ]),
      ),
    );
  }
}

class ChannelCard extends StatelessWidget {
  const ChannelCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://akcdn.detik.net.id/community/media/visual/2022/01/11/kampus-itb.png?w=700&q=90'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(16),
                  )),
                  Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.black87, borderRadius: BorderRadius.circular(30)),
                        child: const Row(
                          children: [
                            Icon(FluentIcons.person_16_regular, color: Colors.white, size: 18),
                            SizedBox(width: 5),
                            Text(
                              '5.1K',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Militan Teknik',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // const Row(
            //   children: [
            //     Row(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         // Icon(FluentIcons.person_24_regular, size: 16),
            //         // SizedBox(width: 5),
            //         Text('5.1K Joined', style: TextStyle(fontSize: 14)),
            //       ],
            //     ),
            // Spacer(),
            // Expanded(
            //   child: Stack(
            //     children: [
            //       CircleAvatar(
            //         radius: 10,
            //         backgroundImage: NetworkImage(
            //             'https://berita.yodu.id/wp-content/uploads/2023/02/profil-onic-kayes.jpg'),
            //       ),
            //       Positioned(
            //         left: 15,
            //         child: CircleAvatar(
            //             radius: 10,
            //             backgroundImage: NetworkImage('https://bit.ly/dan-abramov')),
            //       ),
            //     ],
            //   ),
            // )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
