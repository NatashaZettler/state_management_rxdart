
class WordsList {
  final List<String>? words;

  WordsList._({this.words});

  factory WordsList(List<String>? list, [String word = '']) {
    return WordsList._(words: list ?? []);
  }

  void addWord(String word){
    this.words!.add(word);
  }
}