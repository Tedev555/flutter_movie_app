import 'dart:convert';
import 'dart:io';

import 'package:flutter_movies_app/config/api_config.dart';
import 'package:flutter_movies_app/models/app_exceptions.dart';
import 'package:flutter_movies_app/services/api_provider.dart';
import 'package:http/http.dart' as http;

abstract class MovieService {
  Future<dynamic> fetchDiscoverMovies();
}

class MovieServiceImpl implements MovieService {
  final _apiProvider = ApiProvider();

  @override
  Future<dynamic> fetchDiscoverMovies() async {
    /// Request to get response from HTTP API
    final response = await _apiProvider.request(
      method: ApiConfig.getRequest,
      paths: '${ApiConfig.discoverMoviesPath}?api_key=${ApiConfig.apiKey}',
    );
    return _returnResponse(response);
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case HttpStatus.ok:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
    case HttpStatus.badRequest:
      throw BadRequestException('Your request is invalid');
    case HttpStatus.unauthorized:
      throw UnauthorisedException('Invalid credentials');
    case HttpStatus.forbidden:
      throw ForbiddenException(
          'Access to the resources on the server is denied!');
    case HttpStatus.notFound:
      throw NotFoundException('Not found response');
    case HttpStatus.internalServerError:
      throw ServerException('Something went wrong on server side');
    default:
      throw FetchDataException('Error occured while communication with server');
  }
}
