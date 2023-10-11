import 'package:flutter/material.dart';
import 'package:unsoedfess/screens/home.dart';
import 'package:unsoedfess/screens/story.dart';

class StoryCard extends StatelessWidget {
  final bool isOpen;
  const StoryCard({
    super.key,
    this.isOpen = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                gradient: isOpen
                    ? null
                    : const LinearGradient(
                        begin: Alignment.bottomLeft, colors: [Colors.yellow, Colors.pink]),
                borderRadius: BorderRadius.circular(50)),
            child: GestureDetector(
              onTapUp: (TapUpDetails details) {
                Navigator.push(context, ScaleUpPageRoute(page: const StoryView()));
              },
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const NetworkImage(
                          'https://www.itb.ac.id/files/dokumentasi/1692951240-Mima-Masuk-ITB-2.jpeg'),
                      fit: BoxFit.cover,
                      opacity: isOpen ? 0.5 : 1,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.white, width: 3)),
              ),
            ),
          ),
          const Text('felicia.angel', overflow: TextOverflow.ellipsis)
        ],
      ),
    );
  }
}

class SlideDownPageRoute extends PageRouteBuilder {
  final Widget page;

  SlideDownPageRoute({required this.page})
      : super(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0, -1); // Slide down from the top
            const end = Offset.zero;
            const curve = Curves.fastOutSlowIn;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        );
}

class ScaleUpPageRoute extends PageRouteBuilder {
  final Widget page;

  ScaleUpPageRoute({required this.page})
      : super(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0, -1);
            const end = Offset.zero;
            const curve = Curves.fastOutSlowIn;
            const beginScale = 0.0;
            const endScale = 1.0;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            var scaleTween = Tween(begin: beginScale, end: endScale);
            var scaleAnimation = animation.drive(scaleTween);

            return ScaleTransition(
              scale: scaleAnimation,
              alignment: Alignment.topCenter,
              child: SlideTransition(position: offsetAnimation, child: child),
            );
          },
        );
}
