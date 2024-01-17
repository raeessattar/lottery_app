import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Random random = Random();
  int x = 0;
  int y = 5;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text('Lottery App')
          ),
          backgroundColor: Color(0xffCC1111),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text('Lottery Winning number is $x')
            ),
            SizedBox(height: 20,),
            Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                color: x == y ?
                Colors.green.withOpacity(.3) :
                    Colors.red.withOpacity(.3),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: x == y ?
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_box, size: 30, color: Colors.green,),
                    SizedBox(height: 15,),
                    Text('You won the Lottery your number is $y \n\nCongratulations!', textAlign: TextAlign.center,),
                  ],
                ) :
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, size: 30, color: Colors.red,),
                    SizedBox(height: 15,),
                    Text('Better Luck next time your number is $y \n\nTry Again!', textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            x = random.nextInt(6);
            setState(() {});
          },
          child: Icon(Icons.attach_money),
          backgroundColor: Color(0xffCC1111),
        ),
      ),
    );
  }
}
