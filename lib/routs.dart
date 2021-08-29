import 'package:deaf_project/register_voice.dart';
import 'package:deaf_project/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String,WidgetBuilder> routes ={
  SplashScreen.routeName: (context)=> SplashScreen(),
  Register_Voice.routeName : (context) => Register_Voice()
};