import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movenew/model/moveModel.dart';
import 'package:movenew/network/movieApi.dart';
import 'package:movenew/page/moveDetailPage.dart';

class HomePageBodyDesign extends StatefulWidget {
  const HomePageBodyDesign({super.key});

  @override
  State<HomePageBodyDesign> createState() => _HomePageBodyDesignState();
}

class _HomePageBodyDesignState extends State<HomePageBodyDesign> {
  int activeIndex = 0;
  int? activeLength = 0;
  int pageNumber = 2;
  Future<MoveList>? movieList;
  Future<MoveList>? movieListPage;
  @override
  void initState() {
    movieList = MovieApi.getMovies();
    movieListPage = MovieListPage.getMovies(pageNumber);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Text('Tranding',style: TextStyle(color: Colors.red),),
          ),
        ),
        FutureBuilder(future: movieList,
         builder: (context, snapshot) {
           if(snapshot.hasData){
            return CarouselSlider.builder(itemCount: snapshot.data?.move.length,
             itemBuilder: (context, index, realIndex) {
               return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context) {
                     return MoveDetailPage(
                      moves: snapshot.data?.move[index],
                     );
                   },));
                },
                 child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network('${snapshot.data?.move[index].large_cover_image}'),
                  
                 ),
               );
             },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * .4,
                autoPlay: true,
                enlargeCenterPage: true,
                pageSnapping: true,
                viewportFraction: .6,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                    activeLength = snapshot.data?.move.length;
                  });
                },
              )) ;
           }
           else{
            return CarouselSlider.builder(itemCount: 6,
             itemBuilder: (context, index, realIndex) {
               return GestureDetector(
                onTap: () {
                  
                },
                 child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: const Color.fromARGB(85, 255, 255, 255),
                  ),
                  
                 ),
               );
             },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * .4,
                autoPlay: true,
                enlargeCenterPage: true,
                pageSnapping: true,
                viewportFraction: .6,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                    activeLength = 6;
                  });
                },
              )) ; 
           }
         },),
       Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Text('All Movie',style: TextStyle(color: Colors.red,fontFamily: 'Out_font'),),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .3,
          child: FutureBuilder(future: movieListPage, builder: (context, snapshot) {
            if(snapshot.hasData){
              return GridView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.move.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisExtent: MediaQuery.of(context).size.width * .42,
                  mainAxisSpacing: 10),
               itemBuilder: (context, index) {
                 return GestureDetector(
                  onTap: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) {
                      return MoveDetailPage(
                        moves: snapshot.data!.move[index],
                      );
                    },));
                  },
                   child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage('${snapshot.data!.move[index].large_cover_image}',),fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                    ),
                   ),
                 );
               },);
            }
            else{
              return GridView.builder(
                shrinkWrap: true,
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisExtent: MediaQuery.of(context).size.width * .42,
                  mainAxisSpacing: 10),
               itemBuilder: (context, index) {
                 return Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(60, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                 );
               },);
            }
          },),
        ),
      ],
    );
  }
}