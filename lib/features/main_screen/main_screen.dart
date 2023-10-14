import 'package:flutter/material.dart';
import 'package:unsoedfess/features/main_screen/custom_navbar.dart';
import 'package:unsoedfess/features/channels/channels.dart';
import 'package:unsoedfess/features/home/home_page.dart';
import 'package:unsoedfess/features/messages/messages.dart';
import 'package:unsoedfess/features/profile/profile.dart';
import 'package:unsoedfess/features/explore/explore.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  void changePage(index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          [
            const HomePage(),
            const SearchPage(),
            const ChannelsPage(),
            const InboxPage(),
            const ProfilePage()
          ][pageIndex],
          // const PostingIndicator()
        ],
      ),
      bottomNavigationBar: CustomNavbar(pageIndex: pageIndex, onChangePage: changePage),
    );
  }
}

class PostingIndicator extends StatelessWidget {
  const PostingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          constraints: const BoxConstraints(minWidth: 0, maxWidth: 150),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 10, // Blur radius
                offset: const Offset(0, 3), // Offset from the bottom
              ),
            ],
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 14,
                  width: 14,
                  child: CircularProgressIndicator(color: Colors.black, strokeWidth: 1)),
              SizedBox(width: 10),
              Text('Posting...'),
            ],
          ),
        ),
      ),
    );
  }
}
