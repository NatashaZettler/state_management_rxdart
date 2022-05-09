import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:state_management_rxdart/add_list/word_list_mobx.dart';
import 'package:state_management_rxdart/add_list/word_observable_list_mobx.dart';

class AddObservableListMobX extends StatelessWidget {
  AddObservableListMobX({Key? key, title}) : super(key: key);

  final controller = TextEditingController();
  final wordListMobX = WordObservableListMobX();

  @override
  Widget build(BuildContext context) {
    when(
      (_) => wordListMobX.words.contains('banana'),
      () => print('list contains banana!'),
    );

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: controller,
            ),
            Observer(builder: (_) {
              if (wordListMobX.filterFuture?.status == FutureStatus.pending) {
                return Text('Loading...');
              } else if (wordListMobX.filterFuture?.status ==
                  FutureStatus.rejected) {
                return Text('Error!!!');
              }
              return SizedBox.shrink();
            }),
            Expanded(child: Observer(
              builder: (_) {
                return ListView.builder(
                    itemCount: wordListMobX.words.length,
                    itemBuilder: (context, index) {
                      print('list2 ${wordListMobX.words[index]}');
                      return Text(wordListMobX.words[index]);
                    });
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          wordListMobX.addWord(controller.text);
          print('controller ${controller.text}');
        },
        child: Icon(Icons.add),
      ),
    ));
  }
}
