import 'package:flutter/material.dart';
import 'package:state_management_rxdart/add_list/words_list_provider.dart';
import 'package:provider/provider.dart';

class AddListProvider extends StatelessWidget {
  AddListProvider({Key? key, title}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: Consumer<WordsListProvider>(builder: (context, list, child) {
            return Container(
              child: Column(
                children: [
                  TextField(
                    controller: controller,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: list.words.length,
                        itemBuilder: (context, index) {
                          print(list.words[index]);
                          return Text(list.words[index]);
                        }),
                  )
                ],
              ),
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Provider.of<WordsListProvider>(context, listen: false).addWord(controller.text);
            },
            child: Icon(Icons.add),
          ),
        ));
  }
}