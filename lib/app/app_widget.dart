import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:snow_test/app/external/repositories/question_repository.dart';
import 'package:snow_test/app/presenter/constants/routes/app_route.dart';
import 'package:snow_test/app/presenter/pages/question_bloc.dart';
import 'package:snow_test/app/presenter/styles/app_theme.dart';


class AppWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => QuestionBloc(QuestionRepositoryImpl()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemeData,
        initialRoute: AppRoute.INITIAL,
      ).modular()
    );
  }
}