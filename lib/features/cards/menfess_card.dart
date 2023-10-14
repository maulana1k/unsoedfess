import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:unsoedfess/features/post/menfess.dart';

class MenfessCard extends StatelessWidget {
  const MenfessCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 0.5))),
      child: InkWell(
        onTap: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) => const MenfessPage()));
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(
              children: [
                Icon(FluentIcons.mention_20_filled, size: 18, color: Colors.grey),
                SizedBox(width: 3),
                Text('Menfess', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://www.itb.ac.id/files/dokumentasi/1641892369-ITB-Kampus-Jatinangor-1.JPG'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(8)),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Teknik Jaya',
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
                        SizedBox(width: 6),
                        badges.Badge(
                          badgeContent:
                              Icon(FluentIcons.checkmark_12_filled, size: 10, color: Colors.white),
                          badgeStyle: badges.BadgeStyle(
                              shape: badges.BadgeShape.instagram,
                              badgeColor: Colors.blue,
                              padding: EdgeInsets.all(4)),
                        ),
                      ],
                    ),
                    Text('7 hour', style: TextStyle(color: Colors.grey))
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Jends! info parttime dong',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text('46 Replies',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))
          ]),
        ),
      ),
    );
  }
}
