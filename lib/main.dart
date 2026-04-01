import 'package:alperefesahin_dev/core/di/dependency_injector.dart';
import 'package:alperefesahin_dev/core/init/app_widget.dart';
import 'package:alperefesahin_dev/data/local/local_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alperefesahin_dev/presentation/home/view_model/home_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injectionSetup();

  final LocalDatabase _localdb = getIt<LocalDatabase>();
  await _localdb.start();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<HomeCubit>(create: (_) => getIt<HomeCubit>()),
    ],
    child: const AppWidget(),
  ));
} 
