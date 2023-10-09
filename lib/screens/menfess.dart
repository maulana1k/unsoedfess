import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

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
        title: const Text('Menfess', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://www.itb.ac.id/files/dokumentasi/1641892369-ITB-Kampus-Jatinangor-1.JPG'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(12)),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Teknik Jaya',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    // Text('145  Posts', style: TextStyle(color: Colors.grey, fontSize: 15))
                    // Icon(FluentIcons.circle_16_filled, size: 8, color: Colors.blue),
                    SizedBox(width: 6),
                    Text('4 new posts',
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 14),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300)),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jends! info loker dong.', style: TextStyle(fontSize: 18)),
                    Text('10 minutes ago', style: TextStyle(color: Colors.grey)),
                  ],
                )),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [Icon(FluentIcons.heart_12_regular), Text('63')]),
                  // SizedBox(width: 20),
                  Row(children: [Icon(FluentIcons.eye_12_regular), Text('482')]),
                  // SizedBox(width: 20),
                  Row(children: [Icon(FluentIcons.arrow_repeat_all_16_regular), Text('6')]),
                  // SizedBox(width: 20),
                  Row(children: [Icon(FluentIcons.bookmark_16_regular), Text('14')]),
                ],
              ),
            ),
            const Text('Replies', style: TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
