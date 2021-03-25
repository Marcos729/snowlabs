import 'package:flutter/material.dart';

class SplashScreenWidget{

  static Widget splashScreenWidget(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.amber,
      child: Center(
        child: Image(
          image: AssetImage("assets/logo-snow.png"),
          fit: BoxFit.contain,
          width: 300,
        ),
      ),
    );
  }
}