import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wallpaper/screen/home_Screen.dart';

class progressPageScreen extends StatefulWidget {
  const progressPageScreen({Key? key}) : super(key: key);

  @override
  State<progressPageScreen> createState() => _progressPageScreenState();
}

class _progressPageScreenState extends State<progressPageScreen> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 2),
        (() => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomeScreen()))));
  }  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent.withOpacity(0.8),
      body: Center(child: Text('Wallpaper', style: TextStyle(fontSize: 50,color:Colors.white ),)),
    );
  }
}
