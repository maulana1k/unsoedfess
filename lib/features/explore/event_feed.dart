import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unsoedfess/features/explore/event_page.dart';

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
                  SizedBox(height: 5),
                  Text('Music Festival - Ecopro 2023',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(height: 5),
                  Text(
                    'GOR Satria Purwokerto, 21 Januari 2023',
                    style: TextStyle(fontSize: 15),
                  )
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
