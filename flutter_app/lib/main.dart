import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

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
            const Text('PREFERENCE ACCESS.',
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
          setData();
          showDialog(context: context, builder: (BuildContext context ) => const AlertDialog(
            title: Text("Post"),
            content: Text("get content from URI."),
          ));
        },
      ),
    );
  }


  void setData() async {
    final ob = {
      "title":"foo",
      "author":"SYODA-Tuyano",
      "content":"this is content. これはサンプルのコンテンツです。"
    };
    final jsondata = json.encode(ob);
    var https = await HttpClient();
    HttpClientRequest request = await https.postUrl(Uri.parse(url));
    request.headers.set(HttpHeaders.contentTypeHeader,"application/json; charset=UTF-8");
    request.write(jsondata);
    HttpClientResponse response = await request.close();
    final value = await response.transform(utf8.decoder).join();
    _controller.text = value;
  }
}





