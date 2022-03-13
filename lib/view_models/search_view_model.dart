import 'package:flutter/material.dart';
import 'package:gutenberg/model/result.dart';
import 'package:gutenberg/repo/api_result.dart';
import 'package:gutenberg/repo/book_service.dart';

import '../model/book.dart';

enum status { loadData, error, initial, fetched, noMoreData }

class SearchViewModel extends ChangeNotifier {
  List<Book>? _bookListModel;
  final String _genre;
  String? _error;
  String? _errorCode;

  status _currentState = status.initial;
  int _page = 1;
  int _totalPages = 0;
  int get page => _page;

  List<Book>? get bookList => _bookListModel;
  String? get error => _error;
  String? get errorCode => _errorCode;

  status get currentState => _currentState;
  set setStatus(status newstate) {
    _currentState = newstate;
    notifyListeners();
  }

  SearchViewModel(this._genre) {
    getBooks(_genre);
  }
  void setError(Object error, {int? code}) {
    _error = error.toString();
  }

  void getBooks(String genre, {String? searchquery}) async {
    _currentState = status.loadData;
    notifyListeners();

    var result =
        await BookService.getBooks(genre, _page, searchQuery: searchquery);

    if (_currentState != status.initial && _totalPages == _page) {
      _currentState = status.noMoreData;
      notifyListeners();
    }
    if (result is Success) {
      _totalPages = ((result.response as BookListFromJson).count / 32).ceil();
      _bookListModel!.addAll((result.response as BookListFromJson).books!);
      _page += 1;
    }
    if (result is Failure) {
      setError(result.errorResponse, code: result.code);
    }

    _currentState = status.fetched;
    notifyListeners();
  }
}
