import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = 'Flutter サンプル';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: const Color(0xffe91e63),
        canvasColor: const Color(0xfffafafa),
      ),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}


class _FirstScreenState extends State<FirstScreen> {

  static var _items = <Widget>[];
  static var _message = 'ok';
  static var _tapped = 0;
  static const int max = 5;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < max; i++) {
      var item = ListTile(
        leading: const Icon(Icons.android),
        title: Text('No, $i'),
        onTap: () {
          _tapped = i;
          tapItem();
        }
      );
      _items.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next'),
      ),
      body: Center(
        child: Text(
          _message,
          style: const TextStyle(
            fontSize: 32.0
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: _items,
        ),
      ),
    );
  }

  void tapItem() {
      setState(() {
        _message = 'you tapped No, $_tapped';
      });
    }
}











