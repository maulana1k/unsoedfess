import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:google_fonts/google_fonts.dart';
import 'package:unsoedfess/features/cards/menfess_card.dart';

class ChannelPage extends StatefulWidget {
  const ChannelPage({super.key});

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://akcdn.detik.net.id/community/media/visual/2021/03/13/kampus-universitas-indonesia-dok-istimewa.jpeg?w=700&q=90'),
                      fit: BoxFit.cover)),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Unsyut Base',
                        style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w800)
                            .copyWith(fontSize: 34),
                      ),
                      const SizedBox(width: 8),
                      const badges.Badge(
                        badgeContent:
                            Icon(FluentIcons.checkmark_12_filled, size: 14, color: Colors.white),
                        badgeStyle: badges.BadgeStyle(
                            shape: badges.BadgeShape.instagram,
                            badgeColor: Colors.blue,
                            padding: EdgeInsets.all(6)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('315',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                            Text('Posts',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey)),
                          ],
                        ),
                        const VerticalDivider(thickness: 1, width: 50, indent: 12, endIndent: 12),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('2.351',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                            Text('Joined',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Stack(
                              children: List.generate(5, (index) {
                            return Positioned(
                                left: index * 28,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage([
                                    'https://bit.ly/dan-abramov',
                                    'https://bit.ly/prosper-baba',
                                    'https://bit.ly/kent-c-dodds',
                                    'https://bit.ly/code-beast',
                                    'https://bit.ly/sage-adebayo'
                                  ][index]),
                                ));
                          })),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Tempat tanya, sharing dan cari jodoh jika beruntung 🤪 tapi bukan tempat ribut yaaa',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Colors.black)),
                              onPressed: () {},
                              child: const Text(
                                'Request to Join',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              )),
                        ),
                        const SizedBox(width: 10),
                        // Ink(
                        //   decoration: ShapeDecoration(
                        //     color: Colors.grey.shade200,
                        //     shape: const CircleBorder(),
                        //   ),
                        //   child: IconButton(
                        //     icon: const Icon(FluentIcons.more_horizontal_24_filled),
                        //     color: Colors.black,
                        //     onPressed: () {},
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(thickness: 0.5),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Feeds', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                MenfessCard(),
                MenfessCard(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
