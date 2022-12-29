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
      home: MyHomePage(
        title: this.title
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title}): super();
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Data {
  int _price;
  String _name;
  Data(this._name, this._price): super();

  @override
  String toString() {
    return _name + ':' + _price.toString() + '円';
  }
}

class _MyHomePageState extends State<MyHomePage> {

  static var _message = 'ok';
  static var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(20.0),
                  child: Text(
                    _message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"),
                  ),
                ),

                ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  children:  <Widget>[
                    ListTile(
                      leading: const Icon(Icons.android, size: 32),
                      title: const Text(
                          'first item',
                          style: TextStyle(fontSize: 28)),
                      selected: _index == 1,
                      onTap: () {
                        _index = 1;
                        tapTile();
                      }
                    ),
                    ListTile(
                      leading: const Icon(Icons.favorite, size: 32),
                      title: const Text(
                          'second item',
                          style: TextStyle(fontSize: 28)),
                      selected: _index == 2,
                      onTap: () {
                        _index = 2;
                        tapTile();
                      }
                    ),
                   ListTile(
                      leading: const Icon(Icons.home, size: 32),
                      title: const Text(
                          'third item',
                          style: TextStyle(fontSize: 28)),
                      selected: _index == 3,
                      onTap: () {
                        _index = 3;
                        tapTile();
                      }
                    )
                  ],
                )
              ],
            ),
        )
      );
  }
  void tapTile() {
    setState(() {
      _message = 'you tapped: No, $_index';
    });
  }
}

enum RadioType {
  A, B
}
















