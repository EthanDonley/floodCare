import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flood Awareness',
      theme: ThemeData(
        primaryColor: Colors.blue, // Adjusted primary color to signify water
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue, // Use blue as the primary color
          accentColor: Colors.redAccent, // Adjusted accent color for alerts
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white, // Background color
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black87, // Text color
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            color: Colors.black54, // Text color
            fontSize: 16.0,
          ),
        ),
      ),
      home: const FloodAwarenessHomePage(),
    );
  }
}

class FloodAwarenessHomePage extends StatefulWidget {
  const FloodAwarenessHomePage({Key? key}) : super(key: key);

  @override
  State<FloodAwarenessHomePage> createState() => _FloodAwarenessHomePageState();
}

class _FloodAwarenessHomePageState extends State<FloodAwarenessHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flood Awareness'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Flood Awareness App',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 20.0),
            Text(
              'Stay informed and safe during floods.',
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}