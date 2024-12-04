import 'package:flutter/material.dart';
import 'package:movenew/page/splash.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie',
      home: SplashScreen(),
    )
  );
}