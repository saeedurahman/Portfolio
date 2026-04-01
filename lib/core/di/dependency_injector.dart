import 'package:alperefesahin_dev/data/local/local_database.dart';
import 'package:get_it/get_it.dart';
import 'package:alperefesahin_dev/presentation/home/view_model/home_view_model.dart';

final getIt = GetIt.instance;

void injectionSetup() {
  getIt.registerFactory(() => LocalDatabase());
  getIt.registerFactory(() => HomeCubit(getIt<LocalDatabase>()));
} 
