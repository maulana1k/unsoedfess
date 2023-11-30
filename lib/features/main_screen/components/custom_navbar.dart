import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:unsoedfess/features/create_post/create_post.dart';

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
    return NavigationBar(
        onDestinationSelected: widget.onChangePage,
        selectedIndex: widget.pageIndex,
        backgroundColor: Colors.white,
        height: 50,
        elevation: 0,
        indicatorColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 0),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: [
          NavigationDestination(
              icon: Icon(FluentIcons.home_12_regular, size: 26, color: Colors.grey.shade600),
              selectedIcon: const Icon(FluentIcons.home_12_filled, size: 26),
              label: 'Home'),
          // NavigationDestination(
          //     icon: Iconify(Bx.search, size: 26, color: Colors.grey.shade600),
          //     selectedIcon: const Iconify(Bx.search, size: 26),
          //     label: 'Search'),
          IconButton(
              onPressed: () {
                Navigator.push(context, SlideUpPageRoute(page: const CreatePost()));
              },
              icon: Iconify(Uil.plus_circle, size: 26, color: Colors.grey.shade600)),
          // NavigationDestination(
          //     icon: Iconify(Uil.plus_circle, size: 26, color: Colors.grey.shade600),
          //     selectedIcon: const Iconify(Uil.plus_circle, size: 26),
          //     label: 'Explore'),
          // NavigationDestination(
          //     icon: Iconify(Bx.shopping_bag, size: 26, color: Colors.grey.shade600),
          //     selectedIcon: const Iconify(Bx.bxs_shopping_bag, size: 26),
          //     label: 'Campus Mart'),
          // NavigationDestination(
          //     icon: Badge(
          //         label: const Text('1', style: TextStyle(fontSize: 10)),
          //         child: Icon(FluentIcons.chat_12_regular, size: 24, color: Colors.grey.shade600)),
          //     selectedIcon: const Badge(
          //         label: Text('1', style: TextStyle(fontSize: 10)),
          //         child: Icon(FluentIcons.chat_12_filled, size: 24)),
          //     label: 'Messages'),
          NavigationDestination(
              icon: Iconify(Bx.user, color: Colors.grey.shade600),
              selectedIcon: const Iconify(Bx.bxs_user),
              label: 'Profile'),
          // NavigationDestination(
          //     icon: const AvatarProfile(radius: 15),
          //     selectedIcon: Container(
          //         padding: const EdgeInsets.all(2),
          //         decoration: BoxDecoration(
          //             border: Border.all(color: Colors.black, width: 2),
          //             borderRadius: BorderRadius.circular(100)),
          //         child: const AvatarProfile(radius: 15)),
          //     label: 'Profile'),
        ]);
  }
}

class SlideUpPageRoute extends PageRouteBuilder {
  final Widget page;

  SlideUpPageRoute({required this.page})
      : super(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0, 1);
            const end = Offset.zero;
            const curve = Curves.easeOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        );
}
