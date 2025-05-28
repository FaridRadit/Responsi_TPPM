import 'package:flutter/material.dart';
import 'package:tpm_responsi_123220094/model/model.dart';
import 'package:tpm_responsi_123220094/services/services.dart';


class Updatemovie extends StatefulWidget {
 final movie Movie;
  const Updatemovie({Key? key,required this.Movie});

  @override
  State<Updatemovie> createState() => _UpdatemovieState();
}

class _UpdatemovieState extends State<Updatemovie> {
  final title = TextEditingController();
  final year = TextEditingController();
  final rating = TextEditingController();
  final genre = TextEditingController();
  final director = TextEditingController();
  final synopsis = TextEditingController();
  @override
   Future<void> updateMovie() async {
    if (title.text.trim().isEmpty ||
        year.text.trim().isEmpty ||
        genre.text.trim().isEmpty ||
        director.text.trim().isEmpty ||
        rating.text.trim().isEmpty||
        synopsis.text.trim().isEmpty
        ) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("All data should be filled")));
      return;
    }

    movie newdata = movie(
      id: widget.Movie.id,
      title: title.text,
      year: int.parse(year.text),
      genre: genre.text,
      director: director.text,
      rating: double.parse(rating.text),
      synopsis: synopsis.text,
    );

    try {
      await UserApi.updatemovie(newdata);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Clothes updated successfully")));
      Navigator.pop(context);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to update clothes: $error")));
    }
  }

  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(title: Text("Update Movie"),centerTitle: true,),
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
               TextField(
                controller:director ,
                decoration: const InputDecoration(
                  labelText: "Director",
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
                onPressed: updateMovie,
                child: const Text("Update"),
              ),
            ],
          ),
        )
    );
  }
}