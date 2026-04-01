import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('tr'),
    Locale('ur')
  ];

  /// No description provided for @engineering.
  ///
  /// In en, this message translates to:
  /// **'ENGINEERING'**
  String get engineering;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'saeedurahman760@gmail.com'**
  String get emailAddress;

  /// No description provided for @emailSubject.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get emailSubject;

  /// No description provided for @emailBody.
  ///
  /// In en, this message translates to:
  /// **'Hello, I would like to get in touch with you.'**
  String get emailBody;

  /// No description provided for @howItStartedTitle.
  ///
  /// In en, this message translates to:
  /// **'How it started'**
  String get howItStartedTitle;

  /// No description provided for @howItStartedDescription.
  ///
  /// In en, this message translates to:
  /// **'I was born in 2001 in Turkey and discovered my passion for software engineering at the age of 14. My first attempt was creating a forum called \'forumtim.com\' using Simple Machines Forum (SMF). Though it didn\'t succeed, I didn\'t give up.\n\nWhen I started university in the Mathematics department, I dedicated myself to improving in software engineering. I began my journey with Python, like many others, and later transitioned to web development, which led to an internship at Jotform. In 2020, I discovered Flutter, a rising framework at the time, and decided to specialize as a Flutter developer.\n\nSince then, I\'ve worked with several companies, written Medium articles, recorded YouTube videos, and created open-source projects to contribute to the developer community.'**
  String get howItStartedDescription;

  /// No description provided for @howIsItGoingTitle.
  ///
  /// In en, this message translates to:
  /// **'How is it going'**
  String get howIsItGoingTitle;

  /// No description provided for @howIsItGoingDescription.
  ///
  /// In en, this message translates to:
  /// **'I am a Flutter Developer with extensive experience building intuitive and efficient mobile apps using clean coding practices.\n\nOver the years, I have collaborated with various companies to deliver high-quality Flutter applications tailored to their needs. I\'m eager to take on challenging projects that push the boundaries of mobile app development.\n\nIn my free time, I enjoy creating open-source projects, recording video tutorials via YouTube, and sharing insights through Medium articles.'**
  String get howIsItGoingDescription;

  /// No description provided for @hi.
  ///
  /// In en, this message translates to:
  /// **'Hi! '**
  String get hi;

  /// No description provided for @myNameIs.
  ///
  /// In en, this message translates to:
  /// **'My name is'**
  String get myNameIs;

  /// No description provided for @alperefe.
  ///
  /// In en, this message translates to:
  /// **'Alper Efe '**
  String get alperefe;

  /// No description provided for @swe.
  ///
  /// In en, this message translates to:
  /// **'and I am a\nsoftware engineer.'**
  String get swe;

  /// No description provided for @mapMotionFlutterTitle.
  ///
  /// In en, this message translates to:
  /// **'MapMotion Flutter'**
  String get mapMotionFlutterTitle;

  /// No description provided for @mapMotionFlutterDescription.
  ///
  /// In en, this message translates to:
  /// **'Build a smooth & animated Map app.'**
  String get mapMotionFlutterDescription;

  /// No description provided for @socialDatingTitle.
  ///
  /// In en, this message translates to:
  /// **'Social Dating App with Bloc & DDD'**
  String get socialDatingTitle;

  /// No description provided for @socialDatingDescription.
  ///
  /// In en, this message translates to:
  /// **'Social dating app with Bloc, Freezed, and DDD principles.'**
  String get socialDatingDescription;

  /// No description provided for @textToImageGeneratorTitle.
  ///
  /// In en, this message translates to:
  /// **'Text-to-Image Generator'**
  String get textToImageGeneratorTitle;

  /// No description provided for @textToImageGeneratorDescription.
  ///
  /// In en, this message translates to:
  /// **'Generate images from text prompts using an advanced AI model.'**
  String get textToImageGeneratorDescription;

  /// No description provided for @dddTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Firebase DDD with BLoC'**
  String get dddTitle;

  /// No description provided for @dddDescription.
  ///
  /// In en, this message translates to:
  /// **'Updated DDD series app with Firebase integration and BLoC state.'**
  String get dddDescription;

  /// No description provided for @openSourceTitle.
  ///
  /// In en, this message translates to:
  /// **'Open Source'**
  String get openSourceTitle;

  /// No description provided for @openSourceDescription.
  ///
  /// In en, this message translates to:
  /// **'Open source is a fundamental part of my engineering journey. It\'s how I learn, grow, and contribute back to the community. I feel wonderful to have influenced others with my projects. Feel free to explore some of them on my GitHub!'**
  String get openSourceDescription;

  /// No description provided for @viewMoreOnGithubText.
  ///
  /// In en, this message translates to:
  /// **'View more on GitHub'**
  String get viewMoreOnGithubText;

  /// No description provided for @flutterSocialChatTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Social Chat'**
  String get flutterSocialChatTitle;

  /// No description provided for @flutterSocialChatDescription.
  ///
  /// In en, this message translates to:
  /// **'Hybrid, Functional, and Designed Chat App: Flutter Social Chat.'**
  String get flutterSocialChatDescription;

  /// No description provided for @flutterPersonalWebsiteTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Personal Website'**
  String get flutterPersonalWebsiteTitle;

  /// No description provided for @flutterPersonalWebsiteDescription.
  ///
  /// In en, this message translates to:
  /// **'This Website is an open source project too.'**
  String get flutterPersonalWebsiteDescription;

  /// No description provided for @github.
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get github;

  /// No description provided for @sponsorStream.
  ///
  /// In en, this message translates to:
  /// **'Sponsored by GetStream!'**
  String get sponsorStream;

  /// No description provided for @stayInTouch.
  ///
  /// In en, this message translates to:
  /// **'Stay in touch'**
  String get stayInTouch;

  /// No description provided for @stayInTouchSubText.
  ///
  /// In en, this message translates to:
  /// **'Don\'t miss out on my latest posts and projects! Hit me up on Twitter to stay connected, ask questions, or just chat about anything!'**
  String get stayInTouchSubText;

  /// No description provided for @followMe.
  ///
  /// In en, this message translates to:
  /// **'Follow me'**
  String get followMe;

  /// No description provided for @seeMoreArticles.
  ///
  /// In en, this message translates to:
  /// **'See more articles'**
  String get seeMoreArticles;

  /// No description provided for @writingTitle.
  ///
  /// In en, this message translates to:
  /// **'Medium (FlutterWiz)'**
  String get writingTitle;

  /// No description provided for @writingTitleDescription.
  ///
  /// In en, this message translates to:
  /// **'On Medium, I share my journey as a Flutter developer, tackling topics like state management, architecture, and challenges. In addition to writing for my personal profile, I contribute to well-known publications like CodeX and Towards Dev, helping others through my experiences and insights.'**
  String get writingTitleDescription;

  /// No description provided for @mapAppTitle.
  ///
  /// In en, this message translates to:
  /// **'Building a Map app'**
  String get mapAppTitle;

  /// No description provided for @dateFeb.
  ///
  /// In en, this message translates to:
  /// **'Feb 16, 2025'**
  String get dateFeb;

  /// No description provided for @blocTitle.
  ///
  /// In en, this message translates to:
  /// **'Bloc Usage'**
  String get blocTitle;

  /// No description provided for @dateFebSeven.
  ///
  /// In en, this message translates to:
  /// **'Feb 7, 2025'**
  String get dateFebSeven;

  /// No description provided for @dateJun.
  ///
  /// In en, this message translates to:
  /// **'Jun 18, 2022'**
  String get dateJun;

  /// No description provided for @runwaymlTitle.
  ///
  /// In en, this message translates to:
  /// **'RunwayML Package'**
  String get runwaymlTitle;

  /// No description provided for @pastVideos.
  ///
  /// In en, this message translates to:
  /// **'PAST VIDEOS'**
  String get pastVideos;

  /// No description provided for @watch.
  ///
  /// In en, this message translates to:
  /// **'Watch'**
  String get watch;

  /// No description provided for @youtubeTitle.
  ///
  /// In en, this message translates to:
  /// **'YouTube (FlutterWiz)'**
  String get youtubeTitle;

  /// No description provided for @youtubeDescription.
  ///
  /// In en, this message translates to:
  /// **'I share my experiences and insights on Flutter development as FlutterWiz, focusing on state management, clean architecture, and open-source projects. My videos also cover practical coding challenges and tips, providing a deeper look into the development process.'**
  String get youtubeDescription;

  /// No description provided for @visitYoutubeChannelText.
  ///
  /// In en, this message translates to:
  /// **'Visit FlutterWiz'**
  String get visitYoutubeChannelText;

  /// No description provided for @flutterSohbetleriTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Sohbetleri - TR Podcast'**
  String get flutterSohbetleriTitle;

  /// No description provided for @dateMarch.
  ///
  /// In en, this message translates to:
  /// **'March 12, 2023'**
  String get dateMarch;

  /// No description provided for @flutterSohbetleriDescription.
  ///
  /// In en, this message translates to:
  /// **'Chatting about the journeys of Flutter devs in Turkey—starting with me, in this first episode!'**
  String get flutterSohbetleriDescription;

  /// No description provided for @socialChatTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Social Chat Tutorial'**
  String get socialChatTitle;

  /// No description provided for @dateJan.
  ///
  /// In en, this message translates to:
  /// **'Jan 23, 2023'**
  String get dateJan;

  /// No description provided for @socialChatDescription.
  ///
  /// In en, this message translates to:
  /// **'Learn to build a Flutter social chat app step by step in this tutorial series!'**
  String get socialChatDescription;

  /// No description provided for @flutterMapAppTitle.
  ///
  /// In en, this message translates to:
  /// **'Building a Flutter Map App'**
  String get flutterMapAppTitle;

  /// No description provided for @dateFebTwelve.
  ///
  /// In en, this message translates to:
  /// **'Feb 12, 2025'**
  String get dateFebTwelve;

  /// No description provided for @flutterMapAppDescription.
  ///
  /// In en, this message translates to:
  /// **'Permissions & App Lifecycle, Interactive Maps, Animations & Path Tracking'**
  String get flutterMapAppDescription;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'tr', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'tr': return AppLocalizationsTr();
    case 'ur': return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
