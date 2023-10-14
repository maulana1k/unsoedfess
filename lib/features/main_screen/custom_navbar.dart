import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key, required this.pageIndex, required this.onChangePage});
  final int pageIndex;
  final Function(int) onChangePage;
  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade300, width: 0.5))),
      child: NavigationBar(
          onDestinationSelected: widget.onChangePage,
          selectedIndex: widget.pageIndex,
          backgroundColor: Colors.white,
          height: 50,
          elevation: 0,
          indicatorColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 0),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: [
            const NavigationDestination(
                icon: Icon(FluentIcons.home_16_regular),
                selectedIcon: Icon(FluentIcons.home_16_filled),
                label: 'Home'),
            const NavigationDestination(
                icon: Icon(FluentIcons.search_16_regular),
                selectedIcon: Icon(FluentIcons.search_16_filled),
                label: 'Search'),
            const NavigationDestination(
                icon: Icon(FluentIcons.people_team_16_regular),
                selectedIcon: Icon(FluentIcons.people_team_16_filled),
                label: 'Channel'),
            const NavigationDestination(
                icon: Badge(
                    label: Text('12', style: TextStyle(fontSize: 9)),
                    child: Icon(FluentIcons.mail_16_regular)),
                selectedIcon: Badge(
                    label: Text('12', style: TextStyle(fontSize: 9)),
                    child: Icon(FluentIcons.mail_16_filled)),
                label: 'Messages'),
            NavigationDestination(
                icon: const CircleAvatar(
                  radius: 14,
                  backgroundImage: NetworkImage(
                      'https://berita.yodu.id/wp-content/uploads/2023/02/profil-onic-kayes.jpg'),
                ),
                selectedIcon: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(100)),
                  child: const CircleAvatar(
                    radius: 14,
                    backgroundImage: NetworkImage(
                        'https://berita.yodu.id/wp-content/uploads/2023/02/profil-onic-kayes.jpg'),
                  ),
                ),
                label: 'Profile'),
          ]),
    );
  }
}
