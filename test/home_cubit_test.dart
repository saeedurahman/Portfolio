import 'package:alperefesahin_dev/presentation/home/view_model/home_view_model.dart';
import 'package:alperefesahin_dev/presentation/home/state/home_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('initial state is HomeState.initial', () {
    final cubit = HomeCubit();
    expect(cubit.state, HomeState.initial());
  });
}
