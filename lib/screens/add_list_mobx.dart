import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management_rxdart/add_list/word_list_mobx.dart';

class AddListMobX extends StatelessWidget {
  AddListMobX({Key? key, title}) : super(key: key);

  final controller = TextEditingController();
  WordListMobX wordListMobX = WordListMobX();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: controller,
            ),
            Expanded(child: Observer(
              builder: (_) {

                  return ListView.builder(
                      itemCount: wordListMobX.words.length,
                      itemBuilder: (context, index) {
                        print('list2 ${wordListMobX.words[index]}');
                        return Text(wordListMobX.words[index]);
                      });
                // return Text('list1 ${wordListMobX.words[0]}');
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
