import 'dart:ui';
import 'dart:developer' as developer;
import 'package:alperefesahin_dev/data/local/local_database.dart';
import 'package:alperefesahin_dev/presentation/home/state/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.localDb) : super(HomeState.initial()) {
    _loadCachedLanguage();
  }

  final ILocalDatabase localDb;

  final String settingsBoxName = 'settings';
  final String languageKey = 'language';

  final Locale turkishLanguage = const Locale('tr');
  final Locale englishLanguage = const Locale('en');
  final Locale urduLanguage = const Locale('ur');
  final Locale arabicLanguage = const Locale('ar');

  Future<void> _loadCachedLanguage() async {
    try {
      final hiveBox = localDb.getHiveBox<Locale>(settingsBoxName);
      if (hiveBox.containsKey(languageKey)) {
        final savedLanguage = hiveBox.get(languageKey);

        if (savedLanguage != null) {
          emit(state.copyWith(locale: savedLanguage));
        }
      }
    } catch (e) {
      developer.log('Error loading Locale: $e');
    }
  }

  Future<void> switchLanguage() async {
    emit(state.copyWith(isLoading: true));

    try {
      final Locale currentAppLanguage = state.language;
      late final Locale targetLanguage;

      // Cycle through languages: EN → TR → UR → AR → EN
      if (currentAppLanguage == englishLanguage) {
        targetLanguage = turkishLanguage;
      } else if (currentAppLanguage == turkishLanguage) {
        targetLanguage = urduLanguage;
      } else if (currentAppLanguage == urduLanguage) {
        targetLanguage = arabicLanguage;
      } else {
        targetLanguage = englishLanguage;
      }

      final hiveBox = localDb.getHiveBox<Locale>(settingsBoxName);
      await hiveBox.put(languageKey, targetLanguage);

      emit(state.copyWith(isLoading: false, locale: targetLanguage));
    } catch (e) {
      developer.log('Error switching language: $e');
      emit(state.copyWith(isLoading: false));
    }
  }
} 
