
class MovieModel {
  int? id;
  String? title;
  dynamic rating;
  String? small_cover_image;
  String? large_cover_image;
  String? description_full;
  String? summary;
  String? background_image;


  MovieModel({this.id, this.title, this.rating, this.small_cover_image,this.large_cover_image,this.background_image,this.description_full,this.summary});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      rating: json['rating'],
      small_cover_image: json['small_cover_image'],
      large_cover_image: json['large_cover_image'],
      description_full: json['description_full'],
      summary: json['summary'], 
      background_image: json['background_image'],
    );
  }
}

class MoveList {
  List<MovieModel> move = [];
  MoveList();
  factory MoveList.fromJson(List<dynamic>json){
    MoveList movieList = MoveList();
    for(int i = 0; i < json.length; i++){
      var object = MovieModel.fromJson(json[i]);
      movieList.move.add(object);
      
    }
    return movieList;
  }
  
      
      
    
  }
  

