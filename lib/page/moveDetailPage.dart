// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:movenew/model/moveModel.dart';

class MoveDetailPage extends StatefulWidget {
  MovieModel moves;
  MoveDetailPage({super.key,required this.moves});

  @override
  State<MoveDetailPage> createState() => _MoveDetailPageState();
}

class _MoveDetailPageState extends State<MoveDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
        ),
        height: MediaQuery.of(context).size.height * .075,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton.filled(onPressed: () {}, icon: Text('Download',style: TextStyle(
              fontFamily: 'Out_font',

            ),)),
            IconButton.filled(
                onPressed: () {}, icon: Icon(Icons.heart_broken))
          ],
        ),
      ),
      body: MoveDetail(
        movieModel: widget.moves,
      ),
    );
  }
}

class MoveDetail extends StatefulWidget {
  MovieModel? movieModel;
  MoveDetail({super.key, this.movieModel});

  @override
  State<MoveDetail> createState() => _MoveDetailState();
}

class _MoveDetailState extends State<MoveDetail> {
  Future<MoveList>? movieList;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        Image.network(
          "${widget.movieModel!.large_cover_image}",
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      //color: Color.fromARGB(76, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              splashColor: Colors.white,
                            )),
                        Expanded(
                            flex: 9,
                            child: Center(
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .95,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Color.fromARGB(116, 167, 167, 167)),
                                    child: Center(
                                        child: Text(
                                      "${widget.movieModel!.title}",
                                      style: TextStyle(
                                        fontFamily: 'Out_font',
                                          fontSize: 22,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ))))),
                        Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios,
                              color: Colors.white,),
                              splashColor: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: 50,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      stops: [.001,.9],
                      begin: Alignment.topRight,
                      colors: [
                      Color.fromARGB(14, 44, 44, 44),
                      Colors.black,
                    ],
                    )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Text(
                                'button1',
                              ),
                              style: ButtonStyle(),
                            ),
                            IconButton(onPressed: () {}, icon: Text('button1'))
                          ],
                        ),
                        Text(
                          "${widget.movieModel!.title}",
                          style: TextStyle(fontSize: 30, color: Colors.white,
                          fontFamily: 'Out_font'),
                        ),
                        Text(
                          "Rating : ${widget.movieModel!.rating}",
                          style: TextStyle(fontSize: 10, color: Colors.white,
                          fontFamily: 'Out_font'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 6),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Color.fromARGB(42, 116, 115, 115)),
                            child: Text(
                              'Description',
                              style: TextStyle(color: Colors.white,
                              fontFamily: 'Out_font'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color.fromARGB(40, 31, 30, 30)),
                          child: Text(
                            "${widget.movieModel!.description_full}",
                            style: TextStyle(color: Colors.white,
                            fontFamily: 'Out_font'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,bottom: 8),
                          child: Text(
                                'Summary',
                                style: TextStyle(color: Colors.white,
                                fontFamily: 'Out_font'),
                              ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color.fromARGB(40, 42, 40, 40)),
                          child: Text(
                            "${widget.movieModel!.summary}",
                            style: TextStyle(color: Colors.white,
                            fontFamily: 'Out_font'),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
