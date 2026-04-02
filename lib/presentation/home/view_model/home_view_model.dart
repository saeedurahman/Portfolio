import 'package:alperefesahin_dev/presentation/home/state/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
}
