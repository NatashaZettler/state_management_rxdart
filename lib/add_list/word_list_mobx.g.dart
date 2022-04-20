// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_list_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WordListMobX on WordListMobXBase, Store {
  Computed<List<String>>? _$wordsComputed;

  @override
  List<String> get words =>
      (_$wordsComputed ??= Computed<List<String>>(() => super.words,
              name: 'WordListMobXBase.words'))
          .value;

  final _$_wordsAtom = Atom(name: 'WordListMobXBase._words');

  @override
  List<String> get _words {
    _$_wordsAtom.reportRead();
    return super._words;
  }

  @override
  set _words(List<String> value) {
    _$_wordsAtom.reportWrite(value, super._words, () {
      super._words = value;
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
