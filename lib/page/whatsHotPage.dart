import 'package:flutter/material.dart';
import 'package:movenew/page/appBar.dart';
import 'package:movenew/page/bottomNavigation.dart';
import 'package:movenew/page/whatsHotPabgeBody.dart';

class WhatsHotPage extends StatefulWidget {
  const WhatsHotPage({super.key});

  @override
  State<WhatsHotPage> createState() => _WhatsHotPageState();
}

class _WhatsHotPageState extends State<WhatsHotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xff031330),
      appBar: appBar,
      body: SingleChildScrollView(child: HomePageBody()),
      bottomNavigationBar: HomeBottomNavigationBar(),
    );
  }
}