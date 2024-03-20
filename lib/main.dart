import 'package:aula_supase/appRoutes.dart';
import 'package:aula_supase/keySupabase.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: KeySupabase().url,
    anonKey: KeySupabase().anonKey,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: AppRoutes.routes(),
    initialRoute: AppRoutes.homePage,
  ));
}
