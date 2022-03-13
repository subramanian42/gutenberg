import 'package:gutenberg/model/result.dart';

import 'package:http/http.dart' as http;

import 'api_result.dart';

class BookService {
  static Future<Object> getBooksByGenre(String genre) async {
    try {
      Uri url = Uri.parse(
          'http://skunkworks.ignitesol.com:8000/books?mime_type=image&topic=$genre');
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

  static Future<Object> getBooksByUrl(String bookUrl) async {
    try {
      Uri url = Uri.parse(bookUrl);
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

  static Future<Object> searchBooks(String genre, String searchquery) async {
    try {
      Uri url = Uri.parse(
          "http://skunkworks.ignitesol.com:8000/books?mime_type=image&topic=$genre&search=$searchquery");
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
