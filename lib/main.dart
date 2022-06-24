import 'package:flutter/material.dart';
import 'package:movies/api/API.dart';
import 'package:movies/constants.dart';
import 'package:movies/pages/home_page.dart';

import 'models/movie_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinite Scroll Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Infinite Scroll Demo'),
    );
  }
}
