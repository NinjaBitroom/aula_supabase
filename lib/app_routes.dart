import 'package:aula_supase/pages/cadastro_pessoa_page.dart';
import 'package:aula_supase/pages/forgot_pass_page.dart';
import 'package:aula_supase/pages/home_page.dart';
import 'package:aula_supase/pages/lista_pessoa_page.dart';
import 'package:aula_supase/pages/login_page.dart';
import 'package:aula_supase/pages/register_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const loginPage = 'loginPage';
  static const registerPage = 'registerPage';
  static const forgotPassPage = 'forgotPassPage';
  static const homePage = 'homePage';
  static const cadastroPessoaPage = 'cadastroPessoaPage';
  static const listarPessoaPage = 'listarPessoaPage';

  static Map<String, WidgetBuilder> routesMap() {
    return {
      loginPage: (BuildContext context) => const LoginPage(),
      registerPage: (BuildContext context) => const RegisterPage(),
      forgotPassPage: (BuildContext context) => const ForgotPassPage(),
      homePage: (BuildContext context) => const HomePage(),
      cadastroPessoaPage: (BuildContext context) => const CadastroPessoaPage(),
      listarPessoaPage: (BuildContext context) => const ListaPessoaPage(),
    };
  }
}
