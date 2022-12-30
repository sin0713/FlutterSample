import 'package:flutter/material.dart';
import 'dart:ui' as ui;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next'),
      ),
      body: CustomPaint(
        painter: MyPaint(),
      )
    );
  }


}

class MyPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();

    ui.ParagraphBuilder builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(textDirection: TextDirection.ltr)
    )
      ..pushStyle(ui.TextStyle(color: Colors.red, fontSize: 58.0))
      ..addText('Hello!, ')
      ..pushStyle(ui.TextStyle(color: Colors.blue[700], fontSize: 30.0))
      ..addText('This is a sample of paragraph text. ')
      ..pushStyle(ui.TextStyle(color: Colors.blue[200], fontSize: 30.0))
      ..addText('You can draw MULTI-FONT text!');

    ui.Paragraph paragraph = builder.build()
    ..layout(const ui.ParagraphConstraints(width: 300.0));

    Offset off = Offset(50.0, 50.0);
    canvas.drawParagraph(paragraph, off);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}










