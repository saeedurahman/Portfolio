import 'dart:ui';

import 'package:alperefesahin_dev/data/local/local_database.dart';
import 'package:alperefesahin_dev/presentation/home/view_model/home_view_model.dart';
import 'package:alperefesahin_dev/presentation/home/state/home_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockLocalDatabase extends Mock implements ILocalDatabase {}
class MockBox<T> extends Mock implements Box<T> {}

void main() {
  late MockLocalDatabase mockLocalDb;
  late MockBox<Locale> mockBox;

  setUpAll(() {
    registerFallbackValue(const Locale('en'));
  });

  setUp(() {
    mockLocalDb = MockLocalDatabase();
    mockBox = MockBox<Locale>();
  });

  test('initial state is HomeState.initial when no saved language', () async {
    when(() => mockLocalDb.getHiveBox<Locale>(any())).thenReturn(mockBox);
    when(() => mockBox.containsKey(any())).thenReturn(false);

    final cubit = HomeCubit(mockLocalDb);

    // allow async init to complete
    await Future<void>.delayed(const Duration(milliseconds: 50));

    expect(cubit.state, HomeState.initial());
  });

  blocTest<HomeCubit, HomeState>('switchLanguage toggles language and emits loading',
    setUp: () {
      when(() => mockLocalDb.getHiveBox<Locale>(any())).thenReturn(mockBox);
      when(() => mockBox.containsKey(any())).thenReturn(false);
      when(() => mockBox.put(any(), any())).thenAnswer((_) async {});
    },
    build: () => HomeCubit(mockLocalDb),
    act: (cubit) async => cubit.switchLanguage(),
    expect: () => [
      HomeState(language: const Locale('en'), isLoading: true),
      HomeState(language: const Locale('tr'), isLoading: false),
    ],
  );
}