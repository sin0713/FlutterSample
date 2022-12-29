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
  static var _stars = '☆☆☆☆☆';
  static var _star = 0;
  static var _groupValue = RadioType.A;

  void checkChanged(RadioType? val) {
    setState(() {
      _groupValue = val ?? RadioType.A;
      if (val == RadioType.A) {
         _message = "A";
      } else {
        _message = "B";
      }
    });
  }

  void resultAlert(String value) {
    setState(() {
      _message = 'selected: $value';
    });
  }

  void buttonPressed() {
    showDialog(context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Hello !"),
          content: const Text("This is sample."),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop<String>(context, 'Cancel')
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context, 'OK')
            )
          ]
        )
    ).then((value) => resultAlert(value));
  }

  void buttonPressedA() {
    _message = 'tap "android".';
    _star++;
    update();
  }
  void buttonPressedB() {
    _message =  'tap "favorite".';
    _star--;
    update();
  }
  void update() {
    _star = _star < 0 ? 0 : _star > 5 ? 5 : _star;
    setState(() {
      _stars = '★★★★★☆☆☆☆☆'.substring(5 - _star, 5 - _star + 5);
      _message = _message + '[$_star]';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: BackButton(color: Colors.white),
          actions: <Widget>[
            IconButton(
                onPressed: buttonPressedA,
                tooltip: 'add star....',
                icon: Icon(Icons.android)
            ),
            IconButton(
                onPressed: buttonPressedB,
                tooltip: 'subtract star....',
                icon: Icon(Icons.favorite)
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Center(
              child: Text(_stars,
              style: const TextStyle(
                fontSize: 22.0,
                color: Colors.white),
              )
            )
          )
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
                )
              ],
            ),
        )
      );
  }
}

enum RadioType {
  A, B
}
















