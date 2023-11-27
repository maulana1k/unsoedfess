import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:google_fonts/google_fonts.dart';

class MenfessPage extends StatefulWidget {
  const MenfessPage({super.key});

  @override
  State<MenfessPage> createState() => _MenfessPageState();
}

class _MenfessPageState extends State<MenfessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Menfess',
            style: GoogleFonts.poppins(fontWeight: FontWeight.w700).copyWith(fontSize: 20)),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                      'https://www.itb.ac.id/files/dokumentasi/1641892369-ITB-Kampus-Jatinangor-1.JPG'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Teknik Jaya',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 6),
                        badges.Badge(
                          badgeContent:
                              Icon(FluentIcons.checkmark_12_filled, size: 8, color: Colors.white),
                          badgeStyle: badges.BadgeStyle(
                              shape: badges.BadgeShape.instagram,
                              badgeColor: Colors.blue,
                              padding: EdgeInsets.all(4)),
                        ),
                      ],
                    ),
                    Text('10 minutes ago', style: TextStyle(color: Colors.grey)),
                  ],
                )
              ],
            ),
            Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 16),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  // border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Jends! info loker dong.', style: TextStyle(fontSize: 18)),
                    ),
                    // const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton.icon(
                            onPressed: () {},
                            style: const ButtonStyle(
                                iconColor: MaterialStatePropertyAll(Colors.black),
                                visualDensity: VisualDensity.compact,
                                padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                                side: MaterialStatePropertyAll(BorderSide.none)),
                            icon: const Icon(FluentIcons.heart_16_regular),
                            label: const Text('63', style: TextStyle(color: Colors.black))),
                        OutlinedButton.icon(
                            onPressed: () {},
                            style: const ButtonStyle(
                                iconColor: MaterialStatePropertyAll(Colors.black),
                                visualDensity: VisualDensity.compact,
                                padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                                side: MaterialStatePropertyAll(BorderSide.none)),
                            icon: const Icon(FluentIcons.arrow_repeat_all_16_regular),
                            label: const Text('63', style: TextStyle(color: Colors.black))),
                        OutlinedButton.icon(
                            onPressed: () {},
                            style: const ButtonStyle(
                                iconColor: MaterialStatePropertyAll(Colors.black),
                                visualDensity: VisualDensity.compact,
                                padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                                side: MaterialStatePropertyAll(BorderSide.none)),
                            icon: const Icon(FluentIcons.bookmark_16_regular),
                            label: const Text('63', style: TextStyle(color: Colors.black))),
                        OutlinedButton.icon(
                            onPressed: () {},
                            style: const ButtonStyle(
                                iconColor: MaterialStatePropertyAll(Colors.black),
                                visualDensity: VisualDensity.compact,
                                padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                                side: MaterialStatePropertyAll(BorderSide.none)),
                            icon: const Icon(FluentIcons.data_histogram_16_regular),
                            label: const Text('63', style: TextStyle(color: Colors.black))),
                        // SizedBox(width: 20),
                        // const Row(children: [Icon(FluentIcons.eye_12_regular), Text('482')]),
                        // // SizedBox(width: 20),
                        // const Row(children: [Icon(FluentIcons.arrow_repeat_all_16_regular), Text('6')]),
                        // // SizedBox(width: 20),
                        // const Row(children: [Icon(FluentIcons.bookmark_16_regular), Text('14')]),
                      ],
                    ),
                  ],
                )),
            const Text('All replies', style: TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
