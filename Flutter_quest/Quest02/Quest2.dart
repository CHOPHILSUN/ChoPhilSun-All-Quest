import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.star), // Icon in the upper left corner
          title: const Text('플러터 앱 만들기'), // AppBar 상단의 문구를 표시한다.
          centerTitle: true, // Center the title
        ),
        body: Column(
          children: [
            const Divider(
                color: Colors.black,
                thickness: 2), // Divider as a border between AppBar and body
            Expanded(
              child: Center(
                child: OutlinedButton(
                  onPressed: () {
                    print('버튼이 눌렸습니다'); // Print to debug console
                  },
                  style: OutlinedButton.styleFrom(
                    side:
                    const BorderSide(color: Colors.black), // Outline color
                    shape: const RoundedRectangleBorder(
                      // Rectangular shape
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text('Text'),
                ),
              ),
            ),
            Stack(                    // 반복문을 통해서 컨테이너를 겹치도록 표시한다.
              children: [
                for (var i = 0; i < 5; i++)
                  Container(
                    width: 300.0 - 60 * i,
                    height: 300.0 - 60 * i,
                    decoration: BoxDecoration(
                      color: getRandomColor(),
                      border: Border.all(),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20), // Spacing at the bottom
          ],
        ),
      ),
    );
  }

  // Function to generate a random color
  Color getRandomColor() {                      // 프로그램 실행시 컨네이서너 색상을 랜덤하게 생성한다.
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }
}



