import 'package:flutter/material.dart';
import '../../../utils/list.dart';
import '../view/homeScreen.dart';

class HomeProvider extends ChangeNotifier {
  String? quote;
  String? author;

  void addDetailsInProvider() {
    quote = txtQuote.text;
    author = txtAuthor.text;
  }

  void addQuoteInList() {
    quoteList.insert(0, {'quote': quote, 'author': author});
    notifyListeners();
  }

  void removeQuoteAtIndex(int index) {
    quoteList.removeAt(index);
    notifyListeners();
  }
}
