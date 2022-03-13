import 'package:flutter/material.dart';
import 'package:gutenberg/model/result.dart';
import 'package:gutenberg/repo/api_result.dart';
import 'package:gutenberg/repo/book_service.dart';

import '../model/book.dart';

enum status { loadData, error, initial, fetched, noMoreData, loadMoreData }

class SearchViewModel extends ChangeNotifier {
  List<Book>? _bookListModel;
  final String _genre;
  bool _inits = true;
  String? _error;
  String? _errorCode;
  status _currentState = status.initial;
  int _page = 1;
  int _totalPages = 1;
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
    notifyListeners();
  }

  void getBooks(String genre, {String? searchquery}) async {
    _currentState = _inits ? status.loadData : status.loadMoreData;
    notifyListeners();

    var result = await BookService.getBooksByGenre(genre, _page,
        searchQuery: searchquery);

    if (!_inits && _totalPages == _page) {
      _currentState = status.noMoreData;
      notifyListeners();
    }
    if (result is Success) {
      _inits = false;
      _totalPages = ((result.response as BookListFromJson).count / 32).ceil();
      if (_bookListModel == null) {
        _bookListModel = ((result.response as BookListFromJson).books!);
      } else {
        _bookListModel!.addAll((result.response as BookListFromJson).books!);
      }
      _page += 1;
    }
    if (result is Failure) {
      _currentState = status.error;
      setError(result.errorResponse, code: result.code);
    }

    _currentState = status.fetched;
    notifyListeners();
  }
}
