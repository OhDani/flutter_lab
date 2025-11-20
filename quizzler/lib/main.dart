import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, dynamic>> questionBank = [
    {'text': 'Trái đất quay quanh mặt trời một lần trong 24 giờ.','answer': false},
    {'text': 'Nước sôi ở nhiệt độ 100 độ C dưới áp suất 1 atm.','answer': true},
    {'text': 'Hổ là loài động vật ăn cỏ.','answer': false},
    {'text': 'Mặt trăng phát sáng tự nhiên như mặt trời.','answer': false},
    {'text': 'Con người có 5 giác quan chính.','answer': true},
    {'text': 'Ánh sáng di chuyển nhanh hơn âm thanh.','answer': true},
    {'text': 'Cá mập là loài cá duy nhất không thể bơi lùi.','answer': true}
  ];

  int questionIndex = 0;
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = questionBank[questionIndex]['answer'];

    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }

      if (questionIndex == questionBank.length - 1) {
        questionIndex = 0;
        scoreKeeper.clear();
      } else {
        questionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Câu hỏi
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionIndex]['text'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        // Nút True
        Padding(
          padding: EdgeInsets.all(10.0),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
            child: Text(
              'True',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => checkAnswer(true),
          ),
        ),

        // Nút False
        Padding(
          padding: EdgeInsets.all(10.0),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
            child: Text(
              'False',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => checkAnswer(false),
          ),
        ),

        // ScoreKeeper
        Container(
          padding: EdgeInsets.all(10),
          height: 50,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: scoreKeeper),
          ),
        ),
      ],
    );
  }
}
