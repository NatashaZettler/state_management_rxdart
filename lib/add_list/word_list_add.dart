import 'package:rxdart/rxdart.dart';
import 'package:state_management_rxdart/load_list/words_list.dart';

class WordsListAdd {
  WordsList wordsList = WordsList([]);
  Subject<WordsList> subjectWord;

  WordsListAdd._({required this.wordsList, required this.subjectWord});

  factory WordsListAdd.initial() => WordsListAdd._(
        wordsList: WordsList([]),
        subjectWord: BehaviorSubject<WordsList>.seeded(
          WordsList(['']),
        ),
      );

  get subjectWordStream => subjectWord.stream;

  void addWordList(String word) {
    wordsList.addWord(word);
    subjectWord.sink.add(wordsList);
  }
}
