import 'package:flutter/material.dart';
import 'package:unsoedfess/components/custom_navbar.dart';
import 'package:unsoedfess/screens/channels.dart';
import 'package:unsoedfess/screens/home.dart';
import 'package:unsoedfess/screens/inbox.dart';
import 'package:unsoedfess/screens/profile.dart';
import 'package:unsoedfess/screens/search.dart';

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
      body: <Widget>[
        const HomePage(),
        const SearchPage(),
        const ChannelsPage(),
        const InboxPage(),
        const ProfilePage()
      ][pageIndex],
      bottomNavigationBar: CustomNavbar(pageIndex: pageIndex, onChangePage: changePage),
    );
  }
}
