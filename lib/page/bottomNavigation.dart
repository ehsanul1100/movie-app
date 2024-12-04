import 'package:flutter/material.dart';
import 'package:movenew/page/homePage.dart';
import 'package:movenew/page/whatsHotPage.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  State<HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  Color homeBottonColor = Colors.white;
  Color whatshotBottonColor = Colors.red;
  Color searchBottonColor = Colors.white;
  Color presonBottonColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff031330),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) {
                     return HomePage();
                   },));
                setState(() {
                  homeBottonColor = Colors.red;
                  whatshotBottonColor = Colors.white;
                  searchBottonColor = Colors.white;
                  presonBottonColor = Colors.white;
                });
              },
              icon: Icon(Icons.home, color: homeBottonColor)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) {
                     return WhatsHotPage();
                   },));
                setState(() {
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
    );
  }
}
