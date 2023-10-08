import 'package:booksphere/modules/ui_modules/auth_module/welcome_screen.dart';
import 'package:booksphere/modules/ui_modules/library_module/root_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

import 'modules/ui_modules/auth_module/splash_screen.dart';

final kThemeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.white,
    brightness: Brightness.light,
  ),
  useMaterial3: true,
  fontFamily: GoogleFonts.poppins().fontFamily,
);

class BookSphereApp extends StatelessWidget {
  const BookSphereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookSphere',
      theme: kThemeData,
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          Logger().i("snapshot : ${snapshot.connectionState}");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }

          if (snapshot.hasData) {
            return const RootScreen();
          }

          return const WelcomeScreen();
        },
      ),
    );
  }
}
