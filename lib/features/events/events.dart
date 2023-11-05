import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'event_feed.dart';
import 'poster_image.dart';
import 'top_banner.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  final List posterImages = [
    'assets/images/poster.jpg',
    'assets/images/poster-feed.jpg',
    'assets/images/poster-feed1.jpg',
  ];
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
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              scrolledUnderElevation: 0,
              title: Text('Events',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w700).copyWith(fontSize: 26)),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(FluentIcons.search_16_filled)),
                IconButton(onPressed: () {}, icon: const Icon(FluentIcons.collections_20_filled)),
              ],
            ),
          ];
        },
        body: RefreshIndicator(
          color: Colors.black,
          onRefresh: () {
            return Future.delayed(const Duration(seconds: 2));
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TopBanner(),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Expanded(
                            child: SingleChildScrollView(
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
                          ),
                          IconButton(
                              onPressed: () {}, icon: const Icon(FluentIcons.options_16_filled)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Icon(FluentIcons.feed_16_filled, color: Colors.blue, size: 30),
                            SizedBox(width: 10),
                            Text('Poster',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                          height: 200,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                                children: posterImages
                                    .map((imgUrl) => PosterImage(imageUrl: imgUrl))
                                    .toList()),
                          )),
                      const SizedBox(height: 10),
                      const Column(
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
