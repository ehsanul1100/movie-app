import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movenew/page/homePage.dart';
import 'package:movenew/page/whatsHotPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {

      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context) {
        return HomePage();
      },)
      );

     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Image.asset('images/image10.png')),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 10, 145, 217),
        ),
      ),
    );
  }
}