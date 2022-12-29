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

  static var _message = 'ok.';
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

                Padding(padding: EdgeInsets.all(10.0)),

                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Radio<RadioType>(
                        value: RadioType.A,
                        groupValue: _groupValue,
                        onChanged: checkChanged,
                      ),
                      Text(
                        "Radio A",
                        style: TextStyle(fontSize: 28.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto"),
                      )
                    ],
                  ),

               Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Radio<RadioType>(
                        value: RadioType.B,
                        groupValue: _groupValue,
                        onChanged: checkChanged,
                      ),
                      Text(
                        "Radio B",
                        style: TextStyle(fontSize: 28.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto"),
                      )
                    ],
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
















