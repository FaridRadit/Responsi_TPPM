import 'package:flutter/material.dart';
import 'package:tpm_responsi_123220094/model/model.dart';
import 'package:tpm_responsi_123220094/services/services.dart';
class Detailmovie extends StatelessWidget {
  final int id;
  const Detailmovie({Key? key,required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Clothes Detail"), centerTitle: true),
      body: FutureBuilder<Map<String, dynamic>>(
        future: UserApi.getMovieById(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!['data'] == null) {
            return const Center(child: Text('No data found'));
          }

          final clothesJson = snapshot.data!['data']; // sesuaikan struktur JSON kamu
          final Movie = movie.fromJson(clothesJson);

          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "${Movie.title}",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text("ID: ${Movie.id}", style: const TextStyle(fontSize: 16)),
                        Text("Synopsis: ${Movie.synopsis}", style: const TextStyle(fontSize: 16)),
                        Text("Directory: ${Movie.director}", style: const TextStyle(fontSize: 16)),
                        Text("Genre: ${Movie.genre}", style: const TextStyle(fontSize: 16)),
                        Text("Rating: ${Movie.rating}", style: const TextStyle(fontSize: 16)),
                        Text("Year: ${Movie.year}", style: const TextStyle(fontSize: 16)),
                        // Text("Rating: ${clothes.rating}", style: const TextStyle(fontSize: 16)),
                        // Text("Year Released: ${clothes.yearReleased}", style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}