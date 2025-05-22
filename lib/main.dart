import 'package:flutter/material.dart';
import 'package:newshave/views/login_screen.dart';
import 'package:newshave/views/signup_screen.dart';
import 'package:newshave/views/splash_screen.dart';
import 'package:newshave/views/introduction1_screen.dart';
import 'package:newshave/views/introduction2_screen.dart';
import 'package:newshave/views/introduction3_screen.dart';
import 'package:newshave/views/utils/helper.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Hive',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: cWhite,
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: cPrimary,
          primary: cPrimary,
          onPrimary: cWhite,
          secondary: cTextBlue,
          background: cWhite,
          error: cError,
        ),
        textTheme: TextTheme(
          headlineLarge: headline1,
          headlineMedium: headline3,
          titleMedium: subtitle1,
          bodyMedium: subtitle2,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/intro1': (context) => const Introduction1Screen(),
        '/intro2': (context) => const Introduction2Screen(),
        '/intro3': (context) => const Introduction3Screen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}
