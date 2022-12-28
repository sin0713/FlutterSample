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

  static final _data = [
    Data('Apple', 200),
    Data('Orange', 150),
    Data('Peach', 300)
  ];

  Data _item = _data[0];

  void _setData() {
    setState(() {
      _item = ((_data..shuffle())).first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:
        Center(
          child:
          Text(
            _item.toString(),
            style: const TextStyle(fontSize: 32.0,
                color: Color(0xff000000),
                fontWeight: FontWeight.w700,
                fontFamily: "Roboto"),
          ),
        ),
      );
  }
}
















