import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:unsoedfess/features/profile/avatar_profile.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key, required this.pageIndex, required this.onChangePage});

  final int pageIndex;
  final Function(int) onChangePage;

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration:
          BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade300, width: 0.5))),
      child: NavigationBar(
          onDestinationSelected: widget.onChangePage,
          selectedIndex: widget.pageIndex,
          backgroundColor: Colors.white,
          height: 50,
          elevation: 0,
          indicatorColor: Colors.transparent,
          indicatorShape: const CircleBorder(),
          animationDuration: const Duration(milliseconds: 0),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: [
            NavigationDestination(
                icon: Icon(FluentIcons.home_12_regular, size: 26, color: Colors.grey.shade600),
                selectedIcon: const Icon(FluentIcons.home_12_filled, size: 26),
                label: 'Home'),
            // NavigationDestination(
            //     icon: Icon(FluentIcons.search_16_regular, size: 26, color: Colors.grey.shade600),
            //     selectedIcon: const Icon(FluentIcons.search_16_filled, size: 26),
            //     label: 'Search'),
            NavigationDestination(
                icon: Iconify(Bx.search, size: 24, color: Colors.grey.shade600),
                selectedIcon: const Iconify(Bx.search, size: 24),
                label: 'Search'),
            NavigationDestination(
                icon: Icon(FluentIcons.content_view_gallery_16_regular,
                    size: 28, color: Colors.grey.shade600),
                selectedIcon: const Icon(FluentIcons.content_view_gallery_16_filled, size: 28),
                label: 'Events'),
            NavigationDestination(
                icon: Badge(
                    label: const Text('1', style: TextStyle(fontSize: 10)),
                    child:
                        Icon(FluentIcons.chat_16_regular, size: 28, color: Colors.grey.shade600)),
                selectedIcon: const Badge(
                    label: Text('1', style: TextStyle(fontSize: 10)),
                    child: Icon(FluentIcons.chat_16_filled, size: 28)),
                label: 'Messages'),
            NavigationDestination(
                icon: const AvatarProfile(radius: 15),
                selectedIcon: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(100)),
                    child: const AvatarProfile(radius: 15)),
                label: 'Profile'),
          ]),
    );
  }
}
