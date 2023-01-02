import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:io';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const kColorPurple = Color(0xFF8337ECA);
const kColorPink = Color(0xFFFF006F);
const kColorIndicatorBegin = kColorPink;
const kColorIndicatorEnd = kColorPurple;
const kColorTitle = Color(0xFF616161);
const kColorText = Color(0xFF9E9E9E);
const kElevation = 4.0;

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = 'Flutter サンプル';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.white,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: kColorTitle),
        ),
        backgroundColor: Colors.white,
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text('Battery Optimizer'),
         centerTitle: false,
         elevation: 0,
       ),
       body: SingleChildScrollView(
         child: Column(
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.start,
           children: const [
             OptimizerButtons(),
             Padding(padding: EdgeInsets.all(30.0)),
             BatteryLevelIndicator()
           ],
         ),
       )
    );
  }
}

class _OptimizerButton extends StatelessWidget {
  final String text;

  const _OptimizerButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(color: kColorTitle, fontSize: 12),
      ),
    );
  }
}

class OptimizerButtons extends StatelessWidget {
  const OptimizerButtons({super.key});

    @override
    Widget build(BuildContext context) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
           children: const [
             SizedBox(width: 16),
             _OptimizerButton(text: 'Battery Optimizer'),
             SizedBox(width: 16),
             _OptimizerButton(text: 'Connection Optimizer'),
             SizedBox(width: 16),
             _OptimizerButton(text: 'Memory Optimizer'),
             SizedBox(width: 16),
             _OptimizerButton(text: 'Storage Optimizer'),
           ]),
        ),
      );
  }
}

class _BatteryLevelIndicatorPainter extends CustomPainter {
  final double percentage;
  final double textCircleRadius;

  _BatteryLevelIndicatorPainter({
    required this.percentage,
    required this.textCircleRadius
  });

  @override
  paint(Canvas canvas, Size size) {
    for (int i = 1; i < (360 * percentage); i+=5) {
      final per = i / 360.0;
      final color = ColorTween(
        begin: kColorIndicatorBegin,
        end: kColorIndicatorEnd
      ).lerp(per)!;

      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4;

      const spaceLen = 16;
      const lineLen = 24;
      final angle = (2 * pi * per) - (pi / 2);

      final offset0 = Offset(size.width * 0.5, size.height * 0.5);
      final offset1 = offset0.translate((textCircleRadius + spaceLen) * cos(angle), (textCircleRadius + spaceLen) * sin(angle));
      final offset2 = offset1.translate(lineLen * cos(angle), lineLen * sin(angle));

      canvas.drawLine(offset1, offset2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BatteryLevelIndicator extends StatelessWidget {
  final percentage = 0.7;
  final size = 164.0;

  const BatteryLevelIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BatteryLevelIndicatorPainter(
        percentage: percentage,
        textCircleRadius: size * 0.5
      ),
      child: Material(
        color: Colors.white,
        elevation: kElevation,
        borderRadius: BorderRadius.circular(size * 0.5),
        child: SizedBox(
          width: size,
          height: size,
          child: Center(
            child: Text(
              '${percentage * 100}',
              style: const TextStyle(color: kColorPink, fontSize: 48),
            ),
          ),
        ),
      ),
    );
  }
}






















