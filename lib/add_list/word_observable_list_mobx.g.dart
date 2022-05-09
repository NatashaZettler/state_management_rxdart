// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_observable_list_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WordObservableListMobX on _WordObservableListMobX, Store {
  final _$wordsAtom = Atom(name: '_WordObservableListMobX.words');

  @override
  ObservableList<String> get words {
    _$wordsAtom.reportRead();
    return super.words;
  }

  @override
  set words(ObservableList<String> value) {
    _$wordsAtom.reportWrite(value, super.words, () {
      super.words = value;
    });
  }

  final _$filterFutureAtom = Atom(name: '_WordObservableListMobX.filterFuture');

  @override
  ObservableFuture<dynamic>? get filterFuture {
    _$filterFutureAtom.reportRead();
    return super.filterFuture;
  }

  @override
  set filterFuture(ObservableFuture<dynamic>? value) {
    _$filterFutureAtom.reportWrite(value, super.filterFuture, () {
      super.filterFuture = value;
    });
  }

  final _$_WordObservableListMobXActionController =
      ActionController(name: '_WordObservableListMobX');

  @override
  void addWord(String word) {
    final _$actionInfo = _$_WordObservableListMobXActionController.startAction(
        name: '_WordObservableListMobX.addWord');
    try {
      return super.addWord(word);
    } finally {
      _$_WordObservableListMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
words: ${words},
filterFuture: ${filterFuture}
    ''';
  }
}
