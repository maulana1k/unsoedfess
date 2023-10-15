// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:unsoedfess/config/firebase_options.dart';
// import 'package:unsoedfess/features/auth/signin.dart';
// import 'package:unsoedfess/features/main_screen/main_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   Future<void> initializeFirebase() async {
//     await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: FutureBuilder(
//         future: initializeFirebase(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: Container(
//                 padding: const EdgeInsets.all(24),
//                 color: Colors.white,
//                 child: Text(
//                   'Unsoedfess',
//                   style:
//                       GoogleFonts.merriweather(fontWeight: FontWeight.w800).copyWith(fontSize: 24),
//                 ),
//               ),
//             );
//           } else {
//             return const SignIn();
//           }
//         },
//       ),
//     );
//   }
// }
