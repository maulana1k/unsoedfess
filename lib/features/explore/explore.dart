import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';

import 'event_feed.dart';
import 'poster_image.dart';
import 'top_banner.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
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
              title: Text('Explore',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w700).copyWith(fontSize: 26)),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(FluentIcons.alert_16_regular)),
                IconButton(onPressed: () {}, icon: const Icon(FluentIcons.search_16_regular)),
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
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  const SizedBox(width: 16),
                                  IconButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          visualDensity: VisualDensity.compact,
                                          backgroundColor:
                                              MaterialStatePropertyAll(Colors.grey.shade200)),
                                      icon: const Icon(FluentIcons.filter_16_filled,
                                          color: Colors.black)),
                                  const SizedBox(width: 6),
                                  const CategoryButton(category: 'All', isSelected: true),
                                  const CategoryButton(category: 'Organization'),
                                  const CategoryButton(category: 'Concert'),
                                  const CategoryButton(category: 'Recruitmen'),
                                  const CategoryButton(category: 'Festival'),
                                  const CategoryButton(category: 'Contest'),
                                  const CategoryButton(category: 'Scholarship'),
                                ],
                              ),
                            ),
                          ),
                          // IconButton(
                          //     onPressed: () {}, icon: const Icon(FluentIcons.options_16_filled)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          child: Row(
                            children: [
                              Iconify(Bx.bxs_carousel, size: 26, color: Colors.black87),
                              SizedBox(width: 10),
                              Text('Story',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              Spacer(),
                              Icon(Icons.arrow_forward_rounded, size: 20)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                          height: 180,
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
