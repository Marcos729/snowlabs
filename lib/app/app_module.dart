import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:snow_test/app/app_widget.dart';
import 'package:snow_test/app/presenter/constants/routes/app_route.dart';
import 'package:snow_test/app/presenter/pages/add_question/add_question_page.dart';
import 'package:snow_test/app/presenter/pages/home/home_page.dart';
import 'package:snow_test/app/presenter/pages/splash/splash_screen_page.dart';


class AppModule extends Module {

  // rotas do módulo
  @override
  final List<ModularRoute>  routes = [
    ChildRoute(AppRoute.INITIAL, child: (_, __) => SplashScreenPage()),
    ChildRoute(AppRoute.HOME, child: (_, __) => HomePage()),
    ChildRoute(AppRoute.CADASTRAR, child: (_, __) => AddQuestionPage()),
  ];

  //widget principal
  @override
  Widget get bootstrap => AppWidget();
}