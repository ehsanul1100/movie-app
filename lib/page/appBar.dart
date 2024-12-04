import 'package:flutter/material.dart';

AppBar appBar = AppBar(
  backgroundColor:Color(0xff031330),
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Movie',style: TextStyle(color: Colors.white,fontFamily: 'Out_font'),),
      Text('Movie app',style: TextStyle(color: const Color.fromARGB(255, 159, 158, 158),fontSize: 11,fontFamily: 'Out_font'),),
    ],
  ),
  actions: [
    IconButton(onPressed: (){},
     icon: CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage('images/image11.png')
      ))
  ],
);