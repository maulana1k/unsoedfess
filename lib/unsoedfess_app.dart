import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unsoedfess/features/auth/signin.dart';
import 'package:app_links/app_links.dart';

class UnsoedfessApp extends StatefulWidget {
  const UnsoedfessApp({super.key});

  @override
  State<UnsoedfessApp> createState() => _UnsoedfessAppState();
}

class _UnsoedfessAppState extends State<UnsoedfessApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  @override
  void initState() {
    super.initState();

    initDeepLinks();
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();

    super.dispose();
  }

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();

    // Check initial link if app was in cold state (terminated)
    final appLink = await _appLinks.getInitialAppLink();
    if (appLink != null) {
      print('getInitialAppLink: $appLink');
      openAppLink(appLink);
    }

    // Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      print('onAppLink: $uri');
      openAppLink(uri);
    });
  }

  void openAppLink(Uri uri) {
    _navigatorKey.currentState?.pushNamed(uri.fragment);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unsoedfess',
      debugShowCheckedModeBanner: false,
      theme: _themeData(),
      home: const SignIn(),
    );
  }

  ThemeData _themeData() {
    return ThemeData(
      fontFamily: GoogleFonts.nunitoSans().fontFamily,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      useMaterial3: true,
    );
  }
}
