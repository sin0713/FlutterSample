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

  static var _message = '';
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

                const Padding(padding: EdgeInsets.all(10.0)),

                Padding(padding: EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: buttonPressed,
                  child: const Text(
                    "tap me!",
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"
                    ),
                  ),
                ),)
              ],
            ),
        )
      );
  }
}

enum RadioType {
  A, B
}
















