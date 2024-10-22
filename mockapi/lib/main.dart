import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockapi/app/app_binding.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  final appBinding = AppBinding();
  await appBinding.dependencies();

  runApp(const App());
}
