

import 'package:deaf_project/register_voice.dart';
import 'package:deaf_project/size_config.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:deaf_project/splash/componenets/splash_content.dart';

class WelcomeScreen extends StatelessWidget {
  //static String routeName = "/welcome_screen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body1(),
      ),
    );
  }
}

class Body1 extends StatefulWidget {
  @override
  _Body1State createState() => _Body1State();
}

class _Body1State extends State<Body1> {

  int currentPage = 0;
  List<Map<String , String>> splashData = [
    {
      "image": "assets/images/pngegg.png",
      "text": " تطبيق مساعد للصم وضعاف السمع على إدراك البيئة المحيطة بهم لمساعدتهم في المنزل من خلال تنبيههم بالأصوات المحيطة بهم",
    },
    {
      "image": "assets/images/human.png",
      "text": "يتم ذلك من خلال وصول إشعار بنوع الصوت على الهاتف المحمول للشخص الأصم",
    },
    {
      "image": "assets/images/SpeechToText.png",
      "text": "ولتسهيل عملية التواصل مع الأشخاص الصم سيقدم هذا التطبيق ميزة تحويل الإشارة الكلامية إلى نص مكتوب",
    }
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child:  SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(20.0)),

            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                } ,
                itemCount: splashData.length,
                itemBuilder: (context , index) =>SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]["text"],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:  getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    //Spacer(),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          splashData.length,
                              (index) => buildDot(index: index)
                      ),
                    ),
                    Spacer(flex: 1,),

                    SizedBox(height: getProportionateScreenHeight(15),),
                    Material(
                      color: Colors.teal[800],
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Register_Voice()));
                         // Navigator.pushNamed(context, Register_Voice.routeName);
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text("أبدأ" ,
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white
                              ),),
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 2,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.teal[800] : Colors.white60,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
