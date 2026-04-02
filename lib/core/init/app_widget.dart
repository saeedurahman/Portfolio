import 'package:alperefesahin_dev/core/constants/colors.dart';
import 'package:alperefesahin_dev/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saeed | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: accentCyan,
          surface: backgroundDark,
          onSurface: textPrimary,
        ),
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: GoogleFonts.interTextTheme(
          ThemeData.dark().textTheme,
        ).apply(bodyColor: textPrimary, displayColor: white),
      ),
      home: const HomePage(),
    );
  }
}
