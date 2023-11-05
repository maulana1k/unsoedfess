import 'dart:ui';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unsoedfess/features/messages/message_page.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            Text('Messages',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w700).copyWith(fontSize: 26)),
            const SizedBox(width: 5),
            const Badge(
                backgroundColor: Colors.blue,
                label: Text('2', style: TextStyle(color: Colors.white)))
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              iconSize: 28,
              icon: const Badge(smallSize: 10, child: Icon(FluentIcons.mail_inbox_16_filled))),
          IconButton(
              onPressed: () {}, iconSize: 28, icon: const Icon(FluentIcons.compose_16_filled)),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)),
                child: const Row(
                  children: [
                    Icon(FluentIcons.search_16_filled, size: 20, color: Colors.grey),
                    Expanded(
                      child: TextField(
                          decoration: InputDecoration(
                        isCollapsed: true,
                        hintText: 'Search messages',
                        isDense: true,
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 12),
                      )),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            const NamedChat(),
            const NamedChat(),
            const NamedChat(),
          ],
        ),
      ),
    );
  }
}

class NamedChat extends StatelessWidget {
  const NamedChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => const MessagePage()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage('https://bit.ly/dan-abramov'),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Erick Ganteng',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      )),
                  Text('Lagi sibuk gak?',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Column(
              children: [
                Text('4h', style: TextStyle(color: Colors.grey, fontSize: 14)),
                Badge(
                    backgroundColor: Colors.blue,
                    label: Text('1', style: TextStyle(color: Colors.white)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AnonymChat extends StatelessWidget {
  const AnonymChat({
    super.key,
  });
  void _openMessage(context) {
    showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: const BoxDecoration(color: Colors.black87),
                        child: const Row(
                          children: [
                            Icon(FluentIcons.person_16_regular, color: Colors.white),
                            SizedBox(width: 6),
                            Text(
                              'anonym',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      // const Divider(),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '15 minutes',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            Text(
                              'Kenalan yukk',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _openMessage(context);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey.shade200,
              child: Icon(
                FluentIcons.person_16_filled,
                size: 32,
                color: Colors.grey.shade400,
              ),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('anonym', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                // SizedBox(height: 6),
                Text('Kenalan yukk', style: TextStyle(fontSize: 16)),
              ],
            ),
            const Text('53m', style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
