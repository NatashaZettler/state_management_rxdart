import 'package:mobx/mobx.dart';

part 'word_list_mobx.g.dart';

class WordListMobX = WordListMobXBase with _$WordListMobX;

abstract class WordListMobXBase with Store {
  @observable
  List<String> words = [];

  @action
  void addWord(String word) {
    print('word $word');

    words = words..add(word);
  }
}
