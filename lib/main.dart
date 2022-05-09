import 'package:flutter/material.dart';
import 'package:state_management_rxdart/add_list/words_list_provider.dart';
import 'package:state_management_rxdart/screens/add_fix_list_stream.dart';
import 'package:state_management_rxdart/screens/add_dynamic_list_stream.dart';
import 'package:state_management_rxdart/screens/add_list_mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_management_rxdart/screens/add_observable_list_mobx.dart';
import 'screens/add_list_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => WordsListProvider(),
    child: MainScreen(),
  ));
}

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tabs(),
    );
  }
}

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  var _index = 0;
  final List<Widget> _screens = [
    AddDynamicListStream(title: 'Add List Stream Dynamic'),
    // AddFixListStream(title: 'Add List Stream Fix'),
    AddListProvider(title: 'Add List Provider'),
    AddObservableListMobX(title: 'Add List MobX')
  ];

  void onTabScreen(index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: onTabScreen,
          items: [
            // BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('Fix-List-RxDart')),
            BottomNavigationBarItem(
                icon: Icon(Icons.stream), title: Text('Dynamic-List-RxDart')),
            BottomNavigationBarItem(
                icon: Icon(Icons.stream), title: Text('Dynamic-List-Provider')),
            BottomNavigationBarItem(
                icon: Icon(Icons.stream), title: Text('Dynamic-List-MobX')),
          ],
        ));
  }
}
