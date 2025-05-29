import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:tpm_responsi_123220094/pages/addmovie.dart';
import 'package:tpm_responsi_123220094/pages/updatemovie.dart';
import 'dart:convert';

import '../model/model.dart';

class UserApi {
 static final String url ="https://tpm-api-responsi-a-h-872136705893.us-central1.run.app/api/v1/movies";
  static Future<Map<String,dynamic>> getMovie() async {
    final response=await http.get(Uri.parse(url));
    return jsonDecode(response.body);
  }
  static Future<Map<String,dynamic>> addmovie(movie movie) async {
    final response=await http.post(
      Uri.parse(url),
      headers: {
        'Content-type' : 'application/json',
      },
      body: jsonEncode(movie.toJson()),
    );
    return jsonDecode(response.body);

  }
  static Future<Map<String,dynamic>> updatemovie(movie movie) async {
    final response=await http.patch(
      Uri.parse('$url/${movie.id}'),
      headers: {
        'Content-type' : 'application/json',
      },
      body: jsonEncode(movie.toJson()),
    );
    return jsonDecode(response.body);

  }
  static Future<Map<String,dynamic>> getMovieById (int id) async{
    final response=await http.get(Uri.parse('$url/$id'));
    return jsonDecode(response.body);
    
  }
  static Future<Map<String,dynamic>> deleteMovie(String id) async{
    final response=await http.delete(Uri.parse('$url/$id'));
    return jsonDecode(response.body);
  }
  
}