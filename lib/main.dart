import 'package:aula_supase/keySupabase.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'homePage.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: KeySupabase().url,
    anonKey: KeySupabase().anonKey,
  );
  runApp(const MaterialApp(home: HomePage()));
}
