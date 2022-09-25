import 'dart:io';

import 'package:flutter_movies_app/models/app_exceptions.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<dynamic> request({
    required String paths,
    required method,
    Map<String, String>? headers,
    Map<String, dynamic>? requestBody,
  }) async {
    final url = Uri.parse(paths);
    headers ??= {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      dynamic response;
      switch (method) {
        case 'get':
          response = await http.get(url, headers: headers);
          break;
        case "post":
          response = await http.post(url, headers: headers, body: requestBody);
          break;
        case "put":
          response = await http.put(url, headers: headers, body: requestBody);
          break;
        case "patch":
          response = await http.patch(url, headers: headers, body: requestBody);
          break;
        case "delete":
          response =
              await http.delete(url, headers: headers, body: requestBody);
          break;
        default:
          response = await http.get(url, headers: headers);
      }
      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
}
