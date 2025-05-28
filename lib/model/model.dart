
class movieModel {
  String? status;
  String? message;
  List<movie>? data;
  movieModel({this.status,this.message,this.data});
  movieModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    message = json['message'];
    if(json['data']!=null){
      data = <movie>[];
      json['data'].forEach((v){
        data!.add(movie.fromJson(v));
      });
    }
  }
}
class movie {
 
  int? id;
  String? title;
  int? year;
  double? rating;
  String?genre;
  String? director;
  String? synopsis;
  String? movieUrl;
  String? imgUrl;
  movie({
    this.id,
    this.title,
    this.director,
    this.genre,
    this.imgUrl,
    this.movieUrl,
    this.rating,
    this.synopsis,
    this.year,
  

  });
  movie.fromJson(Map<String,dynamic> json){
    id=json['id']!=null?json['id'].toInt():null;
    title=json['title'];
    year=json['year']!=null?json['year'].toInt():null;
    rating=json['rating'] != null?json['rating'].toDouble():null;
    genre=json['genre'];
    director=json['director'];
    movieUrl=json['movieUrl'];
    imgUrl=json['imgUrl'];
    synopsis=json['synopsis'];
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data=<String,dynamic> {};
   data['id']=id;
   data ['title']=title;
    data['year']=year;
    data['rating']=rating;
   data ['genre']=genre;
    data['director']=director;
   data['movieUrl']=movieUrl;
   data['imgUrl']=imgUrl;
   data['synopsis']=synopsis;
   return data;
  }
  }