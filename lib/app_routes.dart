import 'package:aula_supase/pages/cadastrar_pessoa_page.dart';
import 'package:aula_supase/pages/home_page.dart';
import 'package:aula_supase/pages/listar_pessoa_page.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const homePage = 'homePage';
  static const cadastroPage = 'cadastroPage';
  static const listarPessoaPage = 'listarPessoaPage';

  static Map<String, WidgetBuilder> routes() {
    return {
      homePage: (BuildContext context) => const HomePage(),
      cadastroPage: (BuildContext context) => const CadastrarPessoaPage(),
      listarPessoaPage: (BuildContext context) => const ListarPessoaPage(),
    };
  }
}
