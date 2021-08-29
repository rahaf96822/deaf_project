import 'package:flutter/material.dart';
import 'package:deaf_project/size_config.dart';
import 'package:deaf_project/welcome_screen.dart';
class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        //  backgroundColor: Colors.blueGrey[300],
        // appBar: AppBar(
        //   leading: Text("Skip" , style: TextStyle(color: Colors.grey),),
        // ),
        body: WelcomeScreen(),
      ),
    );
  }
}