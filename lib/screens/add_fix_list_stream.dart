import 'package:flutter/material.dart';
import 'package:state_management_rxdart/load_list/stream_words_ist.dart';
import 'package:state_management_rxdart/load_list/words_list.dart';

class AddFixListStream extends StatefulWidget {
  AddFixListStream({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AddFixListStreamState createState() => _AddFixListStreamState();
}

class _AddFixListStreamState extends State<AddFixListStream> {
  late final StreamWordsList stream;

  @override
  void initState() {
    stream = StreamWordsList();
    stream.getListWord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text(widget.title)),
            body: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
              ),
              child: StreamBuilder(
                  stream: stream.stream,
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      final list = snapshot.data as WordsList;
                      return Column(children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: list.words!.length,
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
