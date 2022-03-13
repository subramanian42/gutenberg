import 'package:gutenberg/model/result.dart';

import 'package:http/http.dart' as http;

import 'api_result.dart';

class BookService {
  static Future<Object> getBooks(String genre, int page,
      {String? searchQuery}) async {
    try {
      if (searchQuery != null) {
        Uri url = Uri.parse(
            "http://skunkworks.ignitesol.com:8000/books?mime_type=image&page=$page&topic=$genre&search=$searchQuery");

        final response = await http.get(url);
        if (response.statusCode == 200) {
          return Success(response: BookListFromJson.fromRawJson(response.body));
        } else {
          return Failure(
              errorResponse: 'Invalid Response', code: response.statusCode);
        }
      } else {
        Uri url = Uri.parse(
            'http://skunkworks.ignitesol.com:8000/books?mime_type=image&page=$page&topic=$genre');
        final response = await http.get(url);
        if (response.statusCode == 200) {
          return Success(response: BookListFromJson.fromRawJson(response.body));
        } else {
          return Failure(
              errorResponse: 'Invalid Response', code: response.statusCode);
        }
      }
    } catch (e) {
      return Failure(
        errorResponse: e,
      );
    }
  }

  static Future<Object> searchBooks(String genre, String searchquery,
      {int page = 1}) async {
    try {
      Uri url = Uri.parse(
          "http://skunkworks.ignitesol.com:8000/books?mime_type=image&page=$page&topic=$genre&search=$searchquery");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return Success(response: BookListFromJson.fromRawJson(response.body));
      } else {
        return Failure(
            errorResponse: 'Invalid Response', code: response.statusCode);
      }
    } catch (e) {
      return Failure(
        errorResponse: e,
      );
    }
  }
}
