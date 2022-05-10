import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart' as mobx;

class NoGenarationMobX extends StatelessWidget {
  NoGenarationMobX({Key? key, title}) : super(key: key);
  Counter counter = Counter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increment();
        },
      ),
      body: Container(child: Observer(builder: (_) {
        return Text(
          '${counter.number.value}',
          style: TextStyle(fontSize: 30),
        );
      })),
    );
  }
}

class Counter {
  var number = mobx.Observable(0);

  late mobx.Action increment;

  Counter() {
    increment = mobx.Action(_increment);
  }

  _increment() {
    number.value = number.value + 1;
  }
}
