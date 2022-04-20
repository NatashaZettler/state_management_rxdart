import 'package:rxdart/rxdart.dart';
import 'package:state_management_rxdart/load_list/words_list.dart';

class StreamWordsList {
  final Stream<WordsList>? stream;
  final Subject<WordsList> _stateSuject;

  StreamWordsList._({this.stream, required Subject<WordsList> stateSubject})
      : _stateSuject = stateSubject;

  factory StreamWordsList() {
    final subject1 = BehaviorSubject<WordsList>();
    return StreamWordsList._(
        stream: subject1.asBroadcastStream(), stateSubject: subject1);
  }

  void getListWord() async {
    try {
      final list = await loadList();
      final addNew = WordsList(list);
      _stateSuject.add(addNew);
    } catch (err) {
      _stateSuject.addError(err);
    }
  }
}

Future<List<String>> loadList() async {
  return await Future.delayed(Duration(seconds: 2), () {
    return [
      'SEGUNDA',
      'ESSA',
      'XIIII',
      'TERCA',
      'OHNO',
      'UUUUUU',
      'QUARTA1',
      'QUARTA2'
    ];
  });
}