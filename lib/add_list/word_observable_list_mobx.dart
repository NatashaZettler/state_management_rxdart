import 'package:mobx/mobx.dart';

part 'word_observable_list_mobx.g.dart';

class WordObservableListMobX = _WordObservableListMobX
    with _$WordObservableListMobX;

abstract class _WordObservableListMobX with Store {
  @observable
  var words = ObservableList<String>();

  @observable
  ObservableFuture? filterFuture;

  final wordFilter = WordFilter();

  @action
  void addWord(String word) {
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
