import 'package:flutter/material.dart';
import 'package:flutter_movies_app/models/movie.dart';
import 'package:flutter_movies_app/repositories/movie_repository.dart';

class MoviesListViewModel extends ChangeNotifier {
  final movieRepo = MovieRepositoryImpl();
  bool loading = false;
  String? error;
  List<Movie> movieList = [];

  MoviesListViewModel() {
    /// Start fetching data when create this object
    fetchMovieData();
  }

  void setLoading(bool state) {
    loading = state;
    notifyListeners();
  }

  Future fetchMovieData() async {
    setLoading(true);
    final result = await movieRepo.fetchDiscoverMovies();
    result.fold((f) {
      error = f.message;
      setLoading(false);
    }, (data) {
      movieList = data;
      setLoading(false);
    });
  }
}
