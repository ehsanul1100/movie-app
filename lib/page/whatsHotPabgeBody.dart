import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:movenew/model/moveModel.dart';
import 'package:movenew/network/movieApi.dart';
import 'package:movenew/page/moveDetailPage.dart';
import 'package:shimmer/shimmer.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  Future<MoveList>? movieList;
  int pageNumber=1;
  @override
  void initState() {
    super.initState();
    movieList = MovieListPage.getMovies(pageNumber);
  }
  Future refresh() async{
    setState(() {
      movieList = MovieApi.getMovies();
    });
  }
  Future getPage()async{
    setState(() {
      movieList = MovieListPage.getMovies(pageNumber);
    });
  }

  final _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
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
        Container(
          alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * .66,
            width: MediaQuery.of(context).size.width * .9,
            child: RefreshIndicator(
              onRefresh: () {
                return refresh() ;
              },
              child: FutureBuilder(
                future: movieList,
                builder: (context, response) {
                  if (response.hasData) {
                    print(movieList);
                    print('grid view');
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          mainAxisExtent: MediaQuery.of(context).size.height * .32,
                        ),
                        itemCount: response.data?.move.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return MoveDetailPage(
                                    moves: response.data?.move[index],
                                  );
                                },
                              ));
                            },
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        child: Image.network(
                                          "${response.data?.move[index].large_cover_image}",
                                          //width: MediaQuery.of(context).size.width *.5,
                                        )),
                                  ),
                                  Text(
                                    "${response.data?.move[index].title}",
                                    style: TextStyle(
                                      fontFamily: 'Out_font',
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 15,
                          mainAxisExtent:
                              MediaQuery.of(context).size.height * .32,
                        ),
                        itemCount: 20,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 9,
                                    child: Shimmer.fromColors(
                                      direction: ShimmerDirection.ltr,
                                      baseColor: Color.fromARGB(151, 158, 158, 158),
                                      highlightColor: Color.fromARGB(97, 53, 53, 53),
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          child: Container(
                                            color: Colors.white,
                                          )
                                          //width: MediaQuery.of(context).size.width *.5,
                                          ),
                                    )),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6),
                                    child: Shimmer.fromColors(
                                      direction: ShimmerDirection.rtl,
                                      baseColor: Color.fromARGB(151, 158, 158, 158),
                                      highlightColor: Color.fromARGB(111, 53, 53, 53),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Container(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  }
                },
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      if(pageNumber > 1) {
                        pageNumber = pageNumber-1;
                        getPage();
                        }
                    });
                  }, icon: Icon(Icons.arrow_back_ios)),
                  IconButton(onPressed: (){
                    setState(() {
                      if(pageNumber <100) pageNumber = pageNumber-1;
                    });
                  }, icon: Icon(Icons.arrow_forward_ios))
                ],
              ),
            )
      ],
    );
  }
}
