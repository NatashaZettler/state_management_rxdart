import 'package:mobx/mobx.dart';

class WordObservableListNoCodeGenMobX with Store {
  var words = ObservableList<String>();

  ObservableFuture? filterFuture;

  final wordFilter = WordFilter();

  late Action addWord = Action(_addWord);

  void _addWord(String word) {
    words.add(word);
    filterFuture = ObservableFuture(wordFilter.checkIfWordListIsValid(words));
  }
}

class WordFilter {
  final forbiddenWords = ['tomato', 'cucumber'];

  Future checkIfWordListIsValid(Iterable<String> wordList) async {
    await Future.delayed(Duration(seconds: 1));
    if (wordList.any((word) => forbiddenWords.contains(word))) {
      throw Exception('A forbidden word was found!');
    }
  }
}
