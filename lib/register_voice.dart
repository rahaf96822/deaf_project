import 'package:deaf_project/screen_record.dart';
import 'package:deaf_project/size_config.dart';
import 'package:flutter/material.dart';

class Register_Voice extends StatefulWidget {
  static String routeName = '/register_voice';
  @override
  _Register_VoiceState createState() => _Register_VoiceState();
}

class _Register_VoiceState extends State<Register_Voice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(20)),
              Text("R2K FOR DEAF",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'RampartOne-Regular',
                fontSize: 50,
                color: Colors.teal[900],
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 20,),
              Container(
                height: getProportionateScreenHeight(150),
                width: getProportionateScreenWidth(250),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[100],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "MY TEXT",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                    )
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.stop, size: 30,color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        primary: Colors.teal[800], // <-- Button color
                        onPrimary: Colors.red, // <-- Splash color
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenRecord()));
                      },
                      child: Icon(Icons.keyboard_voice,size: 30, color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        primary: Colors.teal[800], // <-- Button color
                        onPrimary: Colors.red, // <-- Splash color
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.add, size: 30,color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        primary: Colors.teal[800], // <-- Button color
                        onPrimary: Colors.red, // <-- Splash color
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
