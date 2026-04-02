import 'package:alperefesahin_dev/core/di/dependency_injector.dart';
import 'package:alperefesahin_dev/core/init/app_widget.dart';
import 'package:alperefesahin_dev/data/local/local_database.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injectionSetup();

  final LocalDatabase localdb = getIt<LocalDatabase>();
  await localdb.start();

  runApp(const AppWidget());
}
