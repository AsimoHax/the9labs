import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Question {
  String question;
  bool correctAnswer;

  Question(this.question, this.correctAnswer);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final tickIcon = const Icon(Icons.check, color: Colors.green);
  final crossIcon = const Icon(Icons.clear, color: Colors.red);
  
  int count = 0;
  int score = 0;
  List<Icon> iconsList = [];

  final List<Question> questionsList = [
    Question('Đây là một trò quiz vui vẻ?', true),
    Question('Một tuần có 6 ngày?', false),
    Question('Hình lập phương có 6 mặt?', true),
    Question('Nốt Si cao hơn nốt La?', true),
    Question('Lý Bạch là nhà thơ?', true),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF333455),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 110, left: 20, right: 20),
            child: Text(
              questionsList[count].question,
              style: const TextStyle(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'True',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              onPressed: () {
                _checkAnswer(true);
              },
            ),

            const SizedBox(height: 8),

            // Nút False
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'False',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              onPressed: () {
                _checkAnswer(false);
              },
            ),

            const SizedBox(height: 10),

            Row(children: iconsList),
          ],
        ),
      ],
    );
  }

  void _checkAnswer(bool selectedAnswer) {
    bool correctAnswer = questionsList[count].correctAnswer;

    setState(() {
      if (selectedAnswer == correctAnswer) {
        iconsList.add(tickIcon);
        score++;
      } else {
        iconsList.add(crossIcon);
      }
      if (count < questionsList.length - 1) {
        count++;
      } else {
        _showFinishedDialog();
      }
    });
  }

  void _showFinishedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hoàn thành!'),
          content: Text('Bạn đã trả lời hết tất cả các câu hỏi. Điểm của bạn: $score/${questionsList.length}'),
          actions: <Widget>[
            TextButton(
              child: const Text('Chơi lại'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  count = 0;
                  iconsList.clear();
                  score = 0;
                });
              },
            ),
          ],
        );
      },
    );
  }
}