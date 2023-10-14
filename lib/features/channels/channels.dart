import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unsoedfess/features/channels/channel_page.dart';

class ChannelsPage extends StatefulWidget {
  const ChannelsPage({super.key});

  @override
  State<ChannelsPage> createState() => _ChannelsPageState();
}

class _ChannelsPageState extends State<ChannelsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    scrolledUnderElevation: 0,
                    // leading: const Icon(FluentIcons.channel_48_filled, size: 34),
                    // leading: const Icon(FluentIcons.people_team_32_regular),
                    title: Text('Channels',
                        style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w800)
                            .copyWith(fontSize: 24)),
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
                  )
                ];
              },
              body: const TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [ChannelListTile(), ChannelListTile()])),
        ),
      ),
    );
  }
}

class ChannelListTile extends StatelessWidget {
  const ChannelListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 36,
            margin: const EdgeInsets.all(16),
            decoration:
                BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
            child: const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(FluentIcons.search_32_regular, size: 20),
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
          Column(
            // childAspectRatio: 3 / 4,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(7, (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context, CupertinoPageRoute(builder: (context) => const ChannelPage()));
                },
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://akcdn.detik.net.id/community/media/visual/2021/03/13/kampus-universitas-indonesia-dok-istimewa.jpeg?w=700&q=90'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Unsoed Kita',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                overflow: TextOverflow.ellipsis),
                            Text(
                                'Tempat tanya, sharing dan cari jodoh jika beruntung 🤪 tapi bukan tempat ribut yaaa',
                                style: TextStyle(fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(FluentIcons.person_16_regular, size: 18),
                                    Text(' 2.235',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(FluentIcons.comment_mention_16_regular, size: 18),
                                    Text(' 153',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal))
                                  ],
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(radius: 10),
                                    CircleAvatar(radius: 10),
                                    CircleAvatar(radius: 10),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
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
                    borderRadius: BorderRadius.circular(8),
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
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
