import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:unsoedfess/provider/user_provider.dart';

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
            const NavigationDestination(
                icon: Icon(FluentIcons.home_16_regular, size: 26),
                selectedIcon: Icon(FluentIcons.home_16_filled, size: 26),
                label: 'Home'),
            const NavigationDestination(
                icon: Icon(FluentIcons.search_16_regular, size: 26),
                selectedIcon: Icon(FluentIcons.search_16_filled, size: 26),
                label: 'Search'),
            const NavigationDestination(
                icon: Icon(FluentIcons.channel_16_regular, size: 28),
                selectedIcon: Icon(FluentIcons.channel_16_filled, size: 28),
                label: 'Events'),
            const NavigationDestination(
                icon: Badge(
                    label: Text('12', style: TextStyle(fontSize: 10)),
                    child: Icon(FluentIcons.mail_16_regular, size: 28)),
                selectedIcon: Badge(
                    label: Text('12', style: TextStyle(fontSize: 9)),
                    child: Icon(FluentIcons.mail_16_filled, size: 28)),
                label: 'Messages'),
            Consumer(builder: (context, ref, child) {
              final avatar = ref.read(userProvider).profile?.avatar;
              return NavigationDestination(
                  icon: avatar == ''
                      ? const Iconify(Bx.user, size: 24)
                      : CircleAvatar(
                          radius: 14,
                          backgroundImage: NetworkImage(avatar!),
                        ),
                  selectedIcon: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: avatar == ''
                            ? Border.all(color: Colors.transparent)
                            : Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(100)),
                    child: avatar == ''
                        ? const Iconify(Bx.user_circle, size: 32)
                        : CircleAvatar(
                            radius: 14,
                            backgroundImage: NetworkImage(avatar!),
                          ),
                  ),
                  label: 'Profile');
            }),
          ]),
    );
  }
}
