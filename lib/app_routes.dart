import 'package:aula_supase/pages/cadastro_pessoa_page.dart';
import 'package:aula_supase/pages/home_page.dart';
import 'package:aula_supase/pages/lista_pessoa_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const homePage = 'homePage';
  static const cadastroPage = 'cadastroPage';
  static const listarPessoaPage = 'listarPessoaPage';

  static Map<String, WidgetBuilder> routesMap() {
    return {
      homePage: (BuildContext context) => const HomePage(),
      cadastroPage: (BuildContext context) => const CadastroPessoaPage(),
      listarPessoaPage: (BuildContext context) => const ListaPessoaPage(),
    };
  }
}
