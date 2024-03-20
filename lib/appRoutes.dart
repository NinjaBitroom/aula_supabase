import 'package:aula_supase/pages/cadastroPage.dart';
import 'package:aula_supase/pages/homePage.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const homePage = 'homePage';
  static const cadastroPage = 'cadastroPage';

  static Map<String, WidgetBuilder> routes() {
    return {
      homePage: (BuildContext context) => const HomePage(),
      cadastroPage: (BuildContext context) => const CadastroPage(),
    };
  }
}
