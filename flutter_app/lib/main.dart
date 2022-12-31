import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

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

class _FirstScreenState extends State<FirstScreen> with SingleTickerProviderStateMixin{
  bool flg = false;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text('Next'),
       ),
       body: Padding(
         padding: EdgeInsets.all(20),
         child: Column(
           children: [
             AnimatedAlign(
               alignment: flg ? Alignment.topLeft : Alignment.topRight,
               duration: const Duration(seconds: 1),
               curve: Curves.linear,
               child: Container(
                 color: Colors.red,
                 width: 100,
                 height: 100,
               ),
             )
           ],
         ),
       ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            flg = !flg;
          });
        }),
     );
  }
}

class MyPaint extends CustomPainter {
  final double _value;

  MyPaint(this._value);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();

    canvas.save();

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(100, 255, 0, 255);
    Rect r = Rect.fromLTWH(0, 0, 250, 250);
    canvas.translate(150, 250);
    canvas.rotate(_value);
    canvas.translate(-125, -125);
    canvas.drawRect(r, p);

    //canvas.restore();
    //p.style = PaintingStyle.stroke;
    //p.strokeWidth = 25;
    //p.color = Color.fromARGB(100, 0, 255, 255);
    //r = Rect.fromLTWH(0, 0, 250, 250);
    //canvas.translate(150, 250);
    //canvas.rotate(_value * -1);
    //canvas.translate(-125, -125);
    //canvas.drawRect(r, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}











