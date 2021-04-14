import 'package:flutter/material.dart';
import 'libary.dart';

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
  QuestionBank bank = new QuestionBank();
  List<Widget> scoreKeeper = [];

  void updateQuiz(bool userAnswer) {
    bool correctAnswer = bank.getCurrentAnswer();
    if (userAnswer == correctAnswer) {
      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
    } else {
      scoreKeeper.add(Icon(Icons.clear, color: Colors.red));
    }
    bank.nextQuestion();
  }

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
                  bank.getCurrentQuestion(),
                  style: TextStyle(fontSize: 30, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  updateQuiz(true);
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
                  updateQuiz(false);
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
