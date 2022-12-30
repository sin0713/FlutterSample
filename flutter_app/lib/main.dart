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


class _FirstScreenState extends State<FirstScreen> {
  static ui.Image? _img = null;
  static bool _flg = false;

  Future<void> loadAssetImage(String fname) async {
    final bd = await rootBundle.load("assets/images/$fname");
    final Uint8List u8lst = await Uint8List.view(bd.buffer);
    final codec = await ui.instantiateImageCodec(u8lst);
    final frameInfo = await codec.getNextFrame();
    _img = frameInfo.image;
    setState(() {
      _flg = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    loadAssetImage("android.png");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Next'),
      ),
      body: CustomPaint(
        painter: MyPaint(_img),
      )
    );
  }


}

class MyPaint extends CustomPainter {
  ui.Image? _img = null;

  MyPaint(this._img);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();

    if (_img != null) {
      Rect r0 = Rect.fromLTWH(0.0, 0.0, _img!.width.toDouble(), _img!.height.toDouble());
      Rect r = const Rect.fromLTWH(50.0, 50.0, 100.0, 100.0);
      canvas.drawImageRect(_img!, r0, r, p);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}










