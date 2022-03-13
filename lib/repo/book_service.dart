import 'package:gutenberg/model/result.dart';

import 'package:http/http.dart' as http;

import 'api_result.dart';

class BookService {
  static Future<Object> getBooksByGenre(String genre, int page,
      {String? searchQuery}) async {
    try {
      var bookUrl =
          'http://skunkworks.ignitesol.com:8000/books?mime_type=image&page=$page&topic=$genre';
      if (searchQuery != null) {
        bookUrl =
            'http://skunkworks.ignitesol.com:8000/books?mime_type=image&page=$page&topic=$genre&search=$searchQuery';
      }
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
}
