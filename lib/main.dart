import 'package:flutter/material.dart';
import 'package:unsoedfess/screens/home.dart';
// import 'package:unsoedfess/screens/onboard.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unsoedfess',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.nunitoSans().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
