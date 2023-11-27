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
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Economic Project',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 3 / 4,
              child: Container(
                // height: 400,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage('assets/images/poster-feed.jpg'))),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                const Text(
                  'GOR Satria Purwokerto, 21 Januari 2023',
                  style: TextStyle(fontSize: 15),
                ),
                const Text(
                  'GOR Satria Purwokerto, 21 Januari 2023',
                  style: TextStyle(fontSize: 15),
                ),
              ]),
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 50,
        child: FloatingActionButton.extended(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            onPressed: () {},
            label: const Text(
              'Beli Tiket',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
