import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),
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
            Text('kevin.larr', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(' start following you', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
