import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Activity',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w700).copyWith(fontSize: 24),
        ),
      ),
      body: const SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              // NotificationTile(),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage('https://bit.ly/dan-abramov'),
            ),
            SizedBox(
              width: 10,
            ),
            Text('erick.rs', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(' start following you', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
