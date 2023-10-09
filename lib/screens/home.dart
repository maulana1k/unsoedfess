import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/menfess_card.dart';
import '../components/post_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                title: Text('Unsoedfess',
                    style: GoogleFonts.merriweather(fontWeight: FontWeight.w800)
                        .copyWith(fontSize: 24)),
                actions: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Badge(
                          backgroundColor: Colors.red,
                          smallSize: 10,
                          child: Icon(FluentIcons.alert_16_regular, size: 28),
                        ),
                      ))
                ],
                // forceElevated: innerBoxIsScrolled,
              ),
            ];
          },
          body: ListView(physics: const BouncingScrollPhysics(), children: const [
            LinearProgressIndicator(color: Colors.black, minHeight: 1),
            PostCard(),
            MenfessCard(),
            PostCard(),
            PostCard(),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.black,
          elevation: 16,
          onPressed: () {},
          child: const Icon(FluentIcons.add_28_filled, color: Colors.white),
        ),
      ),
    );
  }
}
