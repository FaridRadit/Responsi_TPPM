import 'package:flutter/material.dart';
import 'package:tpm_responsi_123220094/model/model.dart';
import 'package:tpm_responsi_123220094/pages/addmovie.dart';
import 'package:tpm_responsi_123220094/pages/detailmovie.dart';
import 'package:tpm_responsi_123220094/pages/updatemovie.dart';
import 'package:tpm_responsi_123220094/services/services.dart';
import 'package:tpm_responsi_123220094/widget/movie_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<Map<String, dynamic>> _futureMovie;

  @override
  void initState() {
    super.initState();
    _futureMovie = UserApi.getMovie();
  }

  void _refreshData() {
    setState(() {
      _futureMovie = UserApi.getMovie();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Addmovie()),
                );
                _refreshData(); 
              },
              child: const Text("Add Data"),
            ),
            const SizedBox(height: 20),
            Expanded(child: _clothesContainer()),
          ],
        ),
      ),
    );
  }

  Widget _clothesContainer() {
    return FutureBuilder<Map<String, dynamic>>(
      future: _futureMovie,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          movieModel clothesModel = movieModel.fromJson(snapshot.data!);
          return _clothesGrid(clothesModel.data!);
        } else {
          return const Text("No data available");
        }
      },
    );
  }

  Widget _clothesGrid(List<movie> clothesList) {
    return GridView.builder(
      itemCount: clothesList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 3 / 4,
      ),
      itemBuilder: (context, index) {
        final clothes = clothesList[index];
        return MovieWidget(
          Movie: clothes,
          onDeleted: _refreshData,  
        );
      },
    );
  }
}
