import 'package:dartz/dartz.dart';
import 'package:flutter_movies_app/models/app_exceptions.dart';
import 'package:flutter_movies_app/models/failure.dart';
import 'package:flutter_movies_app/models/movie.dart';
import 'package:flutter_movies_app/services/movie_service.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> fetchDiscoverMovies();
}

class MovieRepositoryImpl implements MovieRepository {
  final _movieService = MovieServiceImpl();

  @override
  Future<Either<Failure, List<Movie>>> fetchDiscoverMovies() async {
    try {
      /// Response body from HTTP
      final res = await _movieService.fetchDiscoverMovies();

      /// Get data from response and return converted to Model
      final results = res['results'] as List<dynamic>;
      return Right(List<Movie>.from((results.map((e) => Movie.fromJson(e)))));
    } catch (e) {
      return _handleException(e);
    }
  }

  /// Transform Exception to correspond messages for end-user
  /// If there is a new exception, must handle here
  _handleException(e) async {
    if (e is AppException) {
      return Left(e.toString());
    }
    if (e is TypeError) {
      return const Left('Type error while parsing response');
    } else if (e is FormatException) {
      return const Left('Format error while parsing response');
    }
    return Left(e.toString());
  }
}
