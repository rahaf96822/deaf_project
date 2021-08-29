import 'package:deaf_project/size_config.dart';
import 'package:flutter/material.dart';


class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.text1,
    this.image,
  }) : super(key: key);
  final String text,image,text1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(20.0)),
        //Spacer(),
        // Spacer(flex: 2,),
        Image.asset(
          image,
          height: getProportionateScreenHeight(250),
          width: getProportionateScreenWidth(230),
        ),
        //Spacer(),
        SizedBox(height: 1,),
        Container(
          height: 70,
          width: double.infinity,
          child: Text(text,
            textAlign:TextAlign.center,
            maxLines: 4,
            style: TextStyle(color: Colors.black , fontSize: 24),
          ),
        ),
         Spacer(flex: 2,),
        //SizedBox(height: 20.0,),

      ],
    );
  }
}