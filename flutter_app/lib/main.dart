import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
  final _controller = TextEditingController();
  static const url = 'https://jsonplaceholder.typicode.com/posts';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text('Home'),
       ),
       body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
          children:  [
            const Text('Firestore ACCESS.',
              style: TextStyle(
                fontSize: 32,
                fontWeight: ui.FontWeight.w500),),
            const Padding(padding: EdgeInsets.all(10.0)),
            TextField(
              controller: _controller,
              style: const TextStyle(fontSize: 24),
              minLines: 1,
              maxLines: 5,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.open_in_new),
        onPressed: () {
          fire();
          showDialog(context: context, builder: (BuildContext context ) => const AlertDialog(
            title: Text("GET Documents"),
            content: Text("connet firestore"),
          ));
        },
      ),
    );
  }


  void fire() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('myData').get();
    var msg = '';
    snapshot.docChanges.forEach((element) {
      final name = element.doc.get('name');
      final mail = element.doc.get('mail');
      final age = element.doc.get('age');
      msg += "${name} (${age}) <${mail}>\n";
    });
    _controller.text = msg;
  }
}





