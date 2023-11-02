import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unsoedfess/config/firebase_options.dart';
import 'package:unsoedfess/features/auth/signin.dart';
import 'package:unsoedfess/features/main_screen/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Unsoedfess',
      debugShowCheckedModeBanner: false,
      theme: _themeData(),
      home: const MainScreen(),
    );
  }

  ThemeData _themeData() {
    return ThemeData(
      fontFamily: GoogleFonts.notoSans().fontFamily,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      useMaterial3: true,
    );
  }
}
