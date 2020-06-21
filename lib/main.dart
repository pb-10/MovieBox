import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task3/utils/colors.dart';
import 'screens/landing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: ColorUtils.appBackgroundColor),
        textTheme: GoogleFonts.arvoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}