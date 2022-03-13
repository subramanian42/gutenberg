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
  bool get loading => _loading;
  List<Book>? get bookList => _bookListModel;
  String? get error => _error;
  String? get errorCode => _errorCode;
  String? get nextResult => _nextResult;
  status get currentState => _currentState;
  void setStatus(status newstate) {
    _currentState = newstate;
  }

  void setLoading(bool state) async {
    _loading = state;
    notifyListeners();
  }

  SearchViewModel(this._genre) {
    getBooks(_genre);
  }
  void setError(Object error, {int? code}) {
    _error = error.toString();
  }

  void getBooks(String genre) async {
    setLoading(true);

    var result = await BookService.getBooksByGenre(genre);

    if (result is Success) {
      _nextResult = (result.response as BookListFromJson).next;
      _bookListModel = (result.response as BookListFromJson).books;
    }
    if (result is Failure) {
      setError(result.errorResponse, code: result.code);
    }

    setLoading(false);
  }

  void nextBooks(String? url) async {
    setLoading(true);
    if (url != null) {
      var result = await BookService.getBooksByUrl(url);
      if (result is Success) {
        _nextResult = (result.response as BookListFromJson).next;
        _bookListModel!.addAll((result.response as BookListFromJson).books!);
      }
      if (result is Failure) {
        setError(result.errorResponse, code: result.code);
      }
    }

    setLoading(false);
    setStatus(status.fetched);
  }

  void searchBooks(String genre, String searchquery) async {
    setLoading(true);
    Object result = await BookService.searchBooks(genre, searchquery);

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
