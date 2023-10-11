import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unsoedfess/screens/profile.dart';

class StoryView extends StatefulWidget {
  const StoryView({super.key});

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: PageView(controller: _pageController, children: const [
          StoryPage(),
          StoryPage(),
        ]),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({
    super.key,
  });

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pop();
        }
      });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => controller.stop(),
      onLongPressEnd: (details) => controller.forward(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: controller.value,
                          minHeight: 2,
                          color: Colors.white,
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: InteractiveViewer(
                    onInteractionStart: (details) => controller.stop(),
                    onInteractionEnd: (details) => controller.forward(),
                    panEnabled: true,
                    minScale: 0.5,
                    maxScale: 2,
                    child: Container(
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://www.itb.ac.id/files/dokumentasi/1692951240-Mima-Masuk-ITB-2.jpeg'),
                        fit: BoxFit.contain,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 20,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, CupertinoPageRoute(builder: (context) => const ProfilePage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundImage: NetworkImage(
                                'https://berita.yodu.id/wp-content/uploads/2023/02/profil-onic-kayes.jpg'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'felicia.angel',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      // const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FluentIcons.more_horizontal_24_regular,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                bottom: 0,
                // top: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(bottom: 30, top: 16),
                      color: Colors.black26,
                      child: const Text(
                        'Dream 🥰',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
