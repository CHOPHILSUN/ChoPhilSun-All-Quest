import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'user.dart';

class OneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("First Page"),
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.pets),
              onPressed: () {
                print('menu button is clicked');
              },
          ),
    ),
          body: Container(
            color: Colors.red,
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  //  Text('NEXT', style: TextStyle(color: Colors.white,fontSize: 30),),
                    ElevatedButton(
                      onPressed: () async{
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondScreen(),
                            ),
                        );


                        print('result:${(result as User).name}');
                      },
                      child: Text('NEXT'),
                    )
                  ],
                ),
            ),
          ),
        )
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Image.asset(
          'images/cat.jpg',
          // 'assets/icon.jpeg', // Replace with the actual path to your cat image
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}