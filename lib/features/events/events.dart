import 'dart:ui';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unsoedfess/features/events/event_page.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              scrolledUnderElevation: 0,
              title: Text('Events',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w700).copyWith(fontSize: 26)),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(FluentIcons.search_16_filled)),
                IconButton(onPressed: () {}, icon: const Icon(FluentIcons.calendar_16_regular)),
                IconButton(onPressed: () {}, icon: const Icon(FluentIcons.options_16_regular)),
              ],
            ),
          ];
        },
        body: RefreshIndicator(
          color: Colors.black,
          onRefresh: () {
            return Future.delayed(const Duration(seconds: 2));
          },
          child: const SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopBanner(),
                      SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(width: 16),
                            CategoryButton(category: 'All', isSelected: true),
                            CategoryButton(category: 'Organization'),
                            CategoryButton(category: 'Concert'),
                            CategoryButton(category: 'Recruitmen'),
                            CategoryButton(category: 'Festival'),
                            CategoryButton(category: 'Contest'),
                            CategoryButton(category: 'Scholarship'),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Icon(FluentIcons.collections_20_filled),
                            SizedBox(width: 10),
                            Text('Poster',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                          height: 250,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Row(children: [
                              PosterImage(),
                              PosterImage(),
                              PosterImage(),
                            ]),
                          )),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          EventFeed(),
                          EventFeed(),
                          EventFeed(),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String category;
  final bool isSelected;
  const CategoryButton({
    super.key,
    required this.category,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      child: OutlinedButton(
          onPressed: () {},
          style: ButtonStyle(
              visualDensity: VisualDensity.compact,
              side: MaterialStateProperty.all(const BorderSide(color: Colors.transparent)),
              overlayColor:
                  MaterialStateProperty.all(isSelected ? Colors.black : Colors.grey.shade400),
              backgroundColor:
                  MaterialStatePropertyAll(isSelected ? Colors.black : Colors.grey.shade200)),
          child: Text(category,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 13))),
    );
  }
}

class TopBanner extends StatefulWidget {
  const TopBanner({super.key});
  @override
  State<TopBanner> createState() {
    return _TopBannerState();
  }
}

class _TopBannerState extends State<TopBanner> {
  final _controller = PageController();
  final List _banner = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: PageView(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                children: _banner.map((url) {
                  return Container(
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(url),
                        )),
                  );
                }).toList()),
          ),
          const SizedBox(height: 10),
          SmoothPageIndicator(
              controller: _controller,
              count: _banner.length,
              effect: const ExpandingDotsEffect(
                  dotHeight: 4, dotWidth: 4, activeDotColor: Colors.black))
        ],
      ),
    );
  }
}

class EventFeed extends StatelessWidget {
  const EventFeed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => const EventPage(title: 'Music Festival')));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Music Festival - Ecopro 2023',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundImage: NetworkImage(
                            'https://cinemags.org/wp-content/uploads/2023/02/Jakarta-Concert-Week-Feed-a.jpg'),
                      ),
                      SizedBox(width: 10),
                      Text('Economic Project',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(FluentIcons.location_16_regular, size: 18),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text('GOR Satria Purwokerto', overflow: TextOverflow.ellipsis),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(FluentIcons.calendar_16_regular, size: 18),
                          SizedBox(width: 8),
                          Text('21 JAN 2023')
                        ],
                      ),
                      SizedBox(width: 14),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                          fit: BoxFit.cover, image: AssetImage('assets/images/poster-feed.jpg'))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(FluentIcons.heart_16_regular, size: 26)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(FluentIcons.share_16_regular, size: 26)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PosterImage extends StatelessWidget {
  const PosterImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: AspectRatio(
        aspectRatio: 9 / 16,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/images/poster.jpg'))),
        ),
      ),
    );
  }
}
