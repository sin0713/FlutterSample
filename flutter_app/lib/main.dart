import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

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
  final _controller = TextEditingController();
  final _fName = 'assets/documents/data.txt';

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
          padding: EdgeInsets.all(20.0),
          child: Column(
          children:  [
            const Text('RESOURCE ACCESS.',
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem( label: 'Save', icon: Icon(Icons.save, color: Colors.white, size: 32, ) ),
          BottomNavigationBarItem(label: 'Load', icon: Icon(Icons.open_in_new, color: Colors.white))
        ],
        onTap: (int value) async {
          switch(value) {
            case 0:
              final value = await loadIt();
              setState(() {
                _controller.text = value;
              });
              showDialog(
                  context: context,
                  builder: (BuildContext context) => const AlertDialog(
                    title: Text('loaded!'),
                    content: Text('load message from Asset.'),
                  ));
              break;
            case 1:

              break;
            default:
              print('no data');
          }
        },
      ),
    );
  }


  Future<String> getDataAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<String> loadIt() async {
    try {
      final res = await getDataAsset(_fName);
      return res;
    } catch(e) {
      return '*** no data ***';
    }
  }
}
