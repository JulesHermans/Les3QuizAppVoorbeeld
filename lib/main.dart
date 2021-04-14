import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> scoreKeeper = [];
  List<String> questions = [
    'Sommige katten zijn allergisch voor mensen',
    'kan een koe een trap naar beneden laten nemen, maar niet naar boven',
    'Een kwart van de menselijke botten bevinden zich in de voet',
  ];
  int questionCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  questions[questionCounter],
                  style: TextStyle(fontSize: 30, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                  questionCounter++;
                });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.green,
                child: Center(
                    child: Text('TRUE',
                        style: TextStyle(fontSize: 24, color: Colors.white))),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  scoreKeeper.add(Icon(Icons.clear, color: Colors.red));
                  questionCounter++;
                });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.red,
                child: Center(
                    child: Text('FALSE',
                        style: TextStyle(fontSize: 24, color: Colors.white))),
              ),
            ),
            Row(
              children: scoreKeeper,
            ),
          ],
        ),
      ),
    );
  }
}
