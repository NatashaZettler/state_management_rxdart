import 'package:flutter/material.dart';
import 'package:state_management_rxdart/add_list/word_list_add.dart';
import 'package:state_management_rxdart/load_list/words_list.dart';

class AddDynamicListStream extends StatelessWidget {
  AddDynamicListStream({Key? key, title}) : super(key: key);

  final stream = WordsListAdd.initial();

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                stream.addWordList(controller.text);
              },
            ),
            appBar: AppBar(),
            body: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
              ),
              child: StreamBuilder<WordsList>(
                  stream: stream.subjectWordStream,
                  builder: (context, snapshot) {
                    print('snapshot $snapshot');
                    if (snapshot.data != null) {
                      final list = snapshot.data;
                      return Column(children: [
                        TextField(
                          controller: controller,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: list!.words!.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                    height: 20,
                                    child: Text(list.words![index].toString()));
                              }),
                        ),
                      ]);
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            )));
  }
}