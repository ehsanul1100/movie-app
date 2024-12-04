import 'package:flutter/material.dart';

class SearchPageBody extends StatefulWidget {
  const SearchPageBody({super.key});

  @override
  State<SearchPageBody> createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody> {
  final _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 8,
            bottom: 16,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .06,
            child: Center(
              child: TextField(
                controller: _search,
                decoration: const InputDecoration(
                    //focusColor: Color.fromARGB(255, 78, 78, 255),
                    prefixIconColor: Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    fillColor: Color.fromARGB(62, 255, 255, 255),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'SCARCH',
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 152, 152, 152),
                        fontFamily: 'Out_font'),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    )),
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}