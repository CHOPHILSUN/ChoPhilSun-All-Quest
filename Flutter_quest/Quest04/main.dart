import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _prediction = "";
  double _probability = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JellyFish Classifier',
      home: Scaffold(
        appBar: AppBar(
          title: Text('JellyFish Classifier'),
          leading: Icon(Icons.star),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/jellyfish.jpg'),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _predict,
                    child: Text('예측 결과'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _getProbability,
                    child: Text('예측 확률'),
                  ),
                ],
              ),
              Text(_prediction),
              Text(_probability.toStringAsFixed(2)),
            ],
          ),
        ),
      ),
    );
  }
}


  Future<void> _predict() async {
    // FastAPI 서버에 요청을 보냅니다.
    final response = await http.post(
      Uri.parse('http://localhost:8000/predict'),
      body: {'image': await _getImageBytes()},
    );

    // 응답을 처리합니다.
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _prediction = data['prediction'];
      });
    } else {
      print(response.statusCode);
    }
  }

  Future<List<int>> _getImageBytes() async {
    // 이미지를 비트 배열로 변환합니다.
    final image = await Image.asset('images/jellyfish.jpg').toImage();
    final bytes = await image.toByteData();
    return bytes.buffer.asUint8List();
  }

  Future<void> _getProbability() async {
    // FastAPI 서버에 요청을 보냅니다.
    final response = await http.post(
      Uri.parse('http://localhost:8000/probability'),
      body: {'image': await _getImageBytes()},
    );

    // 응답을 처리합니다.
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _probability = data['probability'];
      });
    } else {
      print(response.statusCode);
    }
  }
}

<조필선 회고록>

  1. 아쉽게도 퀘스트를 완성하지 못했고 화면 구성만을 시도해 보았습니다.
  2. 잘하고 싶었으나 아직까지는 어려운 것 같고 난이도가 높은 것 같습니다.
