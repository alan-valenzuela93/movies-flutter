// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies/pages/movie_item.dart';

import '../api/API.dart';
import '../constants.dart';
import '../models/movie_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _controller = ScrollController();
  List<Movie> movies = [];
  bool loading = true;

  void getMoviesList() async {
    final request = API();

    int page = 1;
    setState(() {
      loading = true;
    });

    final response =
        await request.fetchMovies("trending/movie/week", page.toString());
    if (response.data != null) {
      setState(() {
        movies = List<Movie>.from(
            response.data["results"].map((x) => Movie.fromJson(x)));
        loading = false;
      });
      if (kDebugMode) {
        logger.i("Peliculas: " + movies.length.toString());
        logger.i(movies[0].posterPath);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getMoviesList();
    //TO-DO:
    //implemente undefined scroll
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(
        itemCount: movies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.7,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 1.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (index < movies.length) {
            final movie = movies[index];
            return Card(
              child: Image.network(movie.posterPath),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
