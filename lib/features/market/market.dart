import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                scrolledUnderElevation: 0,
                title: Text('Campus Mart',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w700).copyWith(fontSize: 22)),
                actions: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(FluentIcons.building_shop_16_regular)),
                  IconButton(onPressed: () {}, icon: const Icon(FluentIcons.search_16_filled)),
                ],
              ),
            ];
          },
          body: const Center(),
        ));
  }
}
