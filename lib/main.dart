import 'package:flutter/material.dart';
import 'package:tpm_responsi_123220094/model/model.dart';
import 'package:tpm_responsi_123220094/pages/addmovie.dart';
import 'package:tpm_responsi_123220094/pages/detailmovie.dart';
import 'package:tpm_responsi_123220094/pages/home.dart';
import 'package:tpm_responsi_123220094/pages/updatemovie.dart';
import 'package:tpm_responsi_123220094/routes/routenames.dart';
import 'package:tpm_responsi_123220094/theme/theme.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteNames.home,
      routes: {
        RouteNames.home:(context)=>Homepage(),
        // RouteNames.detailMovie:(context)=>Detailmovie(Movie.i),
        // RouteNames.addMovie:(context)=>Addmovie(),
        // RouteNames.updateMovie:(context)=>Updatemovie(Movie: movie(),),

      },
      theme: AppTheme.lightTheme,
    );
  }
}