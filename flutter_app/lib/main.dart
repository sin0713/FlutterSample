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
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => SecondScreen('Second'),
        '/third': (context) => ThirdScreen('Third')
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Container(
          child: const Text('Home Screen',
          style: TextStyle(fontSize: 32.0)),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home, size: 32),
          ),
           BottomNavigationBarItem(
             label: 'next',
             icon: Icon(Icons.navigate_next, size: 32),
          )
        ],
        onTap: (int value) {
          if (value == 1) {
            Navigator.pushNamed(context, '/second');
          }
        },
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String _value;
  const SecondScreen(this._value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next'),
      ),
      body: Center(
        child: Container(
          child:  Text('$_value Screen',
          style: const TextStyle(fontSize: 32.0)),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            label: 'prev',
            icon: Icon(Icons.navigate_before, size: 32),
          ),
           BottomNavigationBarItem(
             label: '?',
             icon: Icon(Icons.android, size: 32),
          )
        ],
        onTap: (int value) {
          if (value == 0) {
            Navigator.pop(context);
          }
          if (value == 1) {
            Navigator.pushNamed(context, '/third');
          }
        },
      ),
    );
  }
}


class ThirdScreen extends StatelessWidget {
  final String _value;
  const ThirdScreen(this._value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next'),
      ),
      body: Center(
        child: Container(
          child:  Text('$_value Screen',
          style: const TextStyle(fontSize: 32.0)),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            label: 'prev',
            icon: Icon(Icons.navigate_before, size: 32),
          ),
           BottomNavigationBarItem(
             label: '?',
             icon: Icon(Icons.android, size: 32),
          )
        ],
        onTap: (int value) {
          if (value == 0) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}












