import 'package:alperefesahin_dev/core/constants/colors.dart';
import 'package:alperefesahin_dev/presentation/home/home_page.dart';
import 'package:alperefesahin_dev/presentation/home/view_model/home_view_model.dart';
import 'package:alperefesahin_dev/presentation/home/state/home_state.dart';
import 'package:flutter/material.dart';
import 'package:alperefesahin_dev/presentation/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final Locale appLanguage = state.language;
        final Locale englishLanguage = const Locale('en');
        final bool isAppLanguageEnglish = appLanguage == englishLanguage;

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
            scaffoldBackgroundColor:
                Colors.transparent, // Background handled by HomePage
            textTheme: GoogleFonts.interTextTheme(
              ThemeData.dark().textTheme,
            ).apply(bodyColor: textPrimary, displayColor: white),
          ),
          home: HomePage(
            isAppLanguageEnglish: isAppLanguageEnglish,
            onTapLanguageButton: () {
              context.read<HomeCubit>().switchLanguage();
            },
          ),
          locale: appLanguage,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
