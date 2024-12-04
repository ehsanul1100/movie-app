import 'package:flutter/material.dart';
import 'package:movenew/page/appBar.dart';
import 'package:movenew/page/homePageDesign.dart';
import 'package:movenew/page/searchPagebody.dart';
import 'package:movenew/page/whatsHotPabgeBody.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic homePageBody = HomePageBodyDesign();
  Color homeBottonColor = Colors.red;
  Color whatshotBottonColor = Colors.white;
  Color searchBottonColor = Colors.white;
  Color presonBottonColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031330),
      appBar: appBar,
      body:SingleChildScrollView (child: homePageBody,),
      bottomNavigationBar: Container(
        color: Color(0xff031330),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  homePageBody = HomePageBodyDesign();
                  homeBottonColor = Colors.red;
                  whatshotBottonColor = Colors.white;
                  searchBottonColor = Colors.white;
                  presonBottonColor = Colors.white;
                });
              },
              icon: Icon(Icons.home, color: homeBottonColor)),
          IconButton(
              onPressed: () {
                setState(() {
                  homePageBody = HomePageBody();
                  homeBottonColor = Colors.white;
                  whatshotBottonColor = Colors.red;
                  searchBottonColor = Colors.white;
                  presonBottonColor = Colors.white;
                });
              },
              icon: Icon(
                Icons.whatshot,
                color: whatshotBottonColor,
              )),
          IconButton(
              onPressed: () {
                setState(() {
                  homePageBody = SearchPageBody();
                  homeBottonColor = Colors.white;
                  whatshotBottonColor = Colors.white;
                  searchBottonColor = Colors.red;
                  presonBottonColor = Colors.white;
                });
              },
              icon: Icon(
                Icons.search,
                color: searchBottonColor,
              )),
          IconButton(
              onPressed: () {
                setState(() {
                  homeBottonColor = Colors.white;
                  whatshotBottonColor = Colors.white;
                  searchBottonColor = Colors.white;
                  presonBottonColor = Colors.red;
                });
              },
              icon: Icon(
                Icons.person,
                color: presonBottonColor,
              ))
        ],
      ),
      ),
    );
  }
  
}