import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventPage extends StatefulWidget {
  final String title;
  const EventPage({super.key, required this.title});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/images/poster-feed.jpg'))),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              Text(
                'Music Festival Economic Project',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.notoSans(fontWeight: FontWeight.w700).copyWith(fontSize: 24),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(
                        'https://cinemags.org/wp-content/uploads/2023/02/Jakarta-Concert-Week-Feed-a.jpg'),
                  ),
                  SizedBox(width: 10),
                  Text('Economic Project',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
              const SizedBox(height: 10),
              const Column(
                children: [
                  Row(
                    children: [
                      Icon(FluentIcons.location_16_regular, size: 20),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text('GOR Satria Purwokerto',
                            overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16)),
                      )
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(FluentIcons.calendar_16_regular, size: 20),
                      SizedBox(width: 8),
                      Text('21 JAN 2023', style: TextStyle(fontSize: 16))
                    ],
                  ),
                  SizedBox(width: 14),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
