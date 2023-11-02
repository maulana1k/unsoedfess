import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unsoedfess/features/events/events.dart';
import 'package:unsoedfess/features/main_screen/components/custom_navbar.dart';
import 'package:unsoedfess/features/channels/channels.dart';
import 'package:unsoedfess/features/home/screens/home_page.dart';
import 'package:unsoedfess/features/messages/messages.dart';
import 'package:unsoedfess/features/profile/my_profile.dart';
import 'package:unsoedfess/features/explore/explore.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int pageIndex = 0;
  void changePage(index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const HomePage(),
        const SearchPage(),
        const Events(),
        const InboxPage(),
        const MyProfilePage(),
      ][pageIndex],
      bottomNavigationBar: CustomBottomNavbar(pageIndex: pageIndex, onChangePage: changePage),
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
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3),
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
