import 'package:flutter/material.dart';
import 'package:gutenberg/model/result.dart';
import 'package:gutenberg/repo/api_result.dart';
import 'package:gutenberg/repo/book_service.dart';

import '../model/book.dart';

enum status { loadData, error, initial, fetched }

class SearchViewModel extends ChangeNotifier {
  bool _loading = false;
  List<Book>? _bookListModel;
  final String _genre;
  String? _error;
  String? _errorCode;
  String? _nextResult;
  status _currentState = status.initial;
  int _page = 1;
  int get page => _page;

  bool get loading => _loading;
  List<Book>? get bookList => _bookListModel;
  String? get error => _error;
  String? get errorCode => _errorCode;
  String? get nextResult => _nextResult;
  status get currentState => _currentState;
  set setStatus(status newstate) {
    _currentState = newstate;
    notifyListeners();
  }

  void setLoading(bool state) {
    _loading = state;
    notifyListeners();
  }

  SearchViewModel(this._genre) {
    getBooks(_genre);
  }
  void setError(Object error, {int? code}) {
    _error = error.toString();
  }

  void getBooks(String genre, {int page = 1}) async {
    setLoading(true);

    var result = await BookService.getBooksByGenre(genre, page: page);

    if (result is Success) {
      _nextResult = (result.response as BookListFromJson).next;
      _bookListModel = (result.response as BookListFromJson).books;
    }
    if (result is Failure) {
      setError(result.errorResponse, code: result.code);
    }

    setLoading(false);
  }

  void searchBooks(String genre, String searchquery, {int page = 1}) async {
    setLoading(true);
    Object result =
        await BookService.searchBooks(genre, searchquery, page: page);

    if (result is Success) {
      _nextResult = (result.response as BookListFromJson).next;
      _bookListModel = (result.response as BookListFromJson).books;
    }
    if (result is Failure) {
      setError(result.errorResponse, code: result.code);
    }

    setLoading(false);
  }
}
