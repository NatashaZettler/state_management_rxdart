import 'package:flutter/material.dart';

class WordsListProvider extends ChangeNotifier {
  final List<String> _words = [];

  List<String> get words => _words;

  void addWord(String word) {
    _words.add(word);
    notifyListeners();
  }
}