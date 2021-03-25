import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:snow_test/app/presenter/constants/routes/app_route.dart';
import 'package:snow_test/app/presenter/pages/splash/widgets/splash_screen_widget.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  void initState() {

    Future.delayed(Duration(seconds: 5), () {
      Modular.to.navigate(AppRoute.HOME);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenWidget.splashScreenWidget(context);
  }
}