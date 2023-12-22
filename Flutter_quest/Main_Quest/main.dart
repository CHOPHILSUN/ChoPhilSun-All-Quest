import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Korea CAR classifier',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Korea CAR Classifier'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Define the action when the icon is pressed
            // Example: Open navigation drawer
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input Image
            Image.asset(
              'images/sonata.jpg',
              width: 300, // Adjust the width of the image
              height: 300, // Adjust the height of the image
            ),

            // Loading
            LinearProgressIndicator(),

            // CAR SPEC
            SizedBox(height: 16),
            Text(
              'Car model: Sonata',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Fuel: Gasoline',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Displacement: 2.0L',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Output: 150 horsepower',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
