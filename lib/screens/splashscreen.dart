import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unsoedfess/screens/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1), () => "data"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                color: Colors.white,
                child: Text(
                  'Unsoedfess',
                  style:
                      GoogleFonts.merriweather(fontWeight: FontWeight.w800).copyWith(fontSize: 24),
                ),
              ),
            );
          } else {
            return const MainScreen();
          }
        },
      ),
    );
  }
}
