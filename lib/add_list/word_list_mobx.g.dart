// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_list_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WordListMobX on WordListMobXBase, Store {
  final _$wordsAtom = Atom(name: 'WordListMobXBase.words');

  @override
  List<String> get words {
    _$wordsAtom.reportRead();
    return super.words;
  }

  @override
  set words(List<String> value) {
    _$wordsAtom.reportWrite(value, super.words, () {
      super.words = value;
    });
  }

  final _$WordListMobXBaseActionController =
      ActionController(name: 'WordListMobXBase');

  @override
  void addWord(String word) {
    final _$actionInfo = _$WordListMobXBaseActionController.startAction(
        name: 'WordListMobXBase.addWord');
    try {
      return super.addWord(word);
    } finally {
      _$WordListMobXBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
words: ${words}
    ''';
  }
}
