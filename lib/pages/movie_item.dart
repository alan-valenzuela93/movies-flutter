import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/movie_model.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Card(
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 750,
                child: Image.network(
                    "https://image.tmdb.org/t/p/original/" + movie.posterPath),
              ),
            ),
            /*Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                width: 300,
                height: 80,
                child: Text(
                  movie.overview,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
