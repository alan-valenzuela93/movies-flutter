import 'package:http/http.dart' as http;
import 'package:movies/api/HttpResponse.dart';
import 'dart:convert';
import 'package:movies/constants.dart';
import '../models/movie_model.dart';

class API {
  String apiKey = "?api_key=";
  String baseUrl = 'https://api.themoviedb.org/3/';

  //https://api.themoviedb.org/3/?api_key=1ec2b364073596f360d1b0933970ece2&page=2

  Future<HttpResponse> fetchMovies(String path, String page) async {
    dynamic data;
    List<Movie> movies = [];
    var result = await http.get(Uri.parse(baseUrl + path + apiKey + "&$page"));
    if (result.statusCode == 200) {
      data = jsonDecode(result.body);
      return HttpResponse.success(data);
    } else {
      return HttpResponse.fail(
          statusCode: result.statusCode,
          data: data,
          message: result.reasonPhrase!);
    }
  }
}
