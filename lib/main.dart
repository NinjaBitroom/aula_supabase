import 'package:aula_supase/app_routes.dart';
import 'package:aula_supase/key_supabase.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting();
  await Supabase.initialize(
    url: KeySupabase.url,
    anonKey: KeySupabase.anonKey,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: AppRoutes.define(),
    initialRoute: AppRoutes.loginPage,
  ));
}
