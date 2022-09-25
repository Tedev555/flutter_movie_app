import 'package:flutter/material.dart';
import 'package:flutter_movies_app/pages/movies_list/movies_list.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const MoviesListPage(),
    );
  }
}
