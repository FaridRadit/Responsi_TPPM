import 'package:flutter/material.dart';
import '../model/model.dart';
import '../services/services.dart';
import 'home.dart';
class Addmovie extends StatefulWidget {
  const Addmovie({super.key});

  @override
  State<Addmovie> createState() => _AddmovieState();
}

class _AddmovieState extends State<Addmovie> {
  @override
  
  final title = TextEditingController();
  final year = TextEditingController();
  final rating = TextEditingController();
  final genre = TextEditingController();
  final director = TextEditingController();
  final synopsis = TextEditingController();
  
  Future<void> AddMovie()async {
  try{
   
    double? ratingVal = double.tryParse(rating.text) ?? -1;
    int? yearReleased = int.tryParse(year.text) ?? 0;
    final Movie=movie(
      title: title.text,
      genre: genre.text,
      synopsis: synopsis.text,
      rating: ratingVal,
      year: yearReleased,
      director: director.text,
    );
    final response=await UserApi.addmovie(Movie);
     if (response['status'] == "Success") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Success to add clothes")),
      );
      Navigator.pop(context); 
    }
  }
  catch(error){
ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Failed to add clothes")),
    );
  }
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add Movie"),centerTitle: true,),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TextField(
                controller:title ,
                decoration: const InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
               SizedBox(height: 10,),
              TextField(
                keyboardType: TextInputType.number,
                controller:year ,
                decoration: const InputDecoration(
                  labelText: "Year",
                  border: OutlineInputBorder(),
                ),

              ),
            SizedBox(height: 10,),
              TextField(
                controller: genre,
                decoration: const InputDecoration(
                  labelText: "genre",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: synopsis,
                decoration: const InputDecoration(
                  labelText: "synopsis",
                  border: OutlineInputBorder(),
                ),
              ),
             
              SizedBox(height: 10,),
              TextField(
                controller: rating,
                decoration: const InputDecoration(
                  labelText: "Rating",
                  border: OutlineInputBorder(),
                ),
              ),
             
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: AddMovie,
                child: const Text("Add Clothes"),
              ),
            ],
          ),
        )
    );
  }
}