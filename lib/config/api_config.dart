class ApiConfig {
  static const apiKey = 'api-key';
  static const baseURL = 'http://api.themoviedb.org/3';

  /// HTTP request methods
  static const String getRequest = 'get';
  static const String postRequest = 'post';
  static const String putRequest = 'put';
  static const String patchRequest = 'patch';
  static const String deleteRequest = 'delete';

  // Sub paths
  static const discoverMoviesPath = '$baseURL/discover/movie';
}
