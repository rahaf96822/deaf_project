import 'dart:convert';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'dart:io';
import 'dart:async';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
class ScreenRecord extends StatefulWidget {
  @override
  _ScreenRecordState createState() => _ScreenRecordState();
}

class _ScreenRecordState extends State<ScreenRecord> {

  FlutterSoundRecorder _myRecorder;
  final audioPlayer = AssetsAudioPlayer();
  bool _play = false;
  String filepath;
  String _recordertxt = "00:00:00";

  void startIt() async {
    filepath ='/Desktop/temp.wav';
    _myRecorder = FlutterSoundRecorder();
    await _myRecorder.openAudioSession(
      focus: AudioFocus.requestFocusAndStopOthers,
      category: SessionCategory.playAndRecord,
      mode: SessionMode.modeDefault,
      device: AudioDevice.speaker,
    );
    await _myRecorder.setSubscriptionDuration(Duration(milliseconds:10 ));
    await initializeDateFormatting();

    await Permission.microphone.request();
    await Permission.storage.request();
   // await Permission.manageExternalStorage.request();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startIt();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 400,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromARGB(255, 2, 199, 256), Color.fromARGB(255, 6, 75, 210)],
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(MediaQuery.of(context).size.width,100.0)
                )
              ),
              child: Text(
                _recordertxt,
                style: TextStyle(
                  fontSize: 70,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               buildElevatedButton(icon: Icons.mic , iconColor: Colors.red ,),
                SizedBox(width: 30,),
                buildElevatedButton(icon: Icons.stop , iconColor: Colors.black ,),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildElevatedButton(icon: Icons.play_arrow , iconColor: Colors.black ,),
                SizedBox(width: 30,),
                buildElevatedButton(icon: Icons.stop , iconColor: Colors.black ,),
              ],
            ),
          ],
        ),
      ),
    );
  }
  ElevatedButton buildElevatedButton({IconData icon , Color iconColor , Function f}){
    return  ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(5.0),
          side: BorderSide(
              color: Colors.orangeAccent,
              width: 3.0
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          primary: Colors.white,
          elevation: 10.0
      ),
      onPressed: (){},
      icon: Icon(
        icon , color: iconColor, size: 35,
      ),
      label: Text(""),
    );
  }

  // Future<void> record() async{
  //   Directory dir = Directory(path.dirname(filepath));
  //   if (!dir.existsSync()){
  //     dir.createSync();
  //   }
  //   _myRecorder.openAudioSession();
  //   await _myRecorder.startRecorder(
  //       toFile: filepath,
  //       codec: Codec.pcm16WAV
  //   );
  //
  //   StreamSubscription _recorderSubscription = _myRecorder.onProgress.listen((e) {
  //     var date = DateTime.fromMillisecondsSinceEpoch(e.duration.inMilliseconds , isUtc: true);
  //     var txt = DateFormat('mm:ss:SS' , 'en_CB').format(date);
  //
  //     setState(() {
  //       _recordertxt = txt.substring(0,0);
  //     });
  //   });
  //   _recorderSubscription.cancel();
  // }

  Future<String> _stopRecord() async{
    _myRecorder.closeAudioSession();
    return await _myRecorder.stopRecorder();
  }

  Future<void> startPlaying() async {
    audioPlayer.open(
      Audio.file(filepath),
      autoStart: true,
      showNotification: true
    );
  }

  Future<void> stopPlaying(){
    audioPlayer.stop();
  }
}

