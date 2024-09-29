import 'package:flutter/material.dart';
import 'review_page.dart';

class QuizPage extends StatefulWidget {
  final String title;
  final String subtitle;

  const QuizPage({Key? key, required this.title, required this.subtitle}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  List<Map<String, dynamic>> questions = [
    {
      'question': 'Jika 3x + 7 = 16, maka nilai x adalah...',
      'options': ['1', '2', '3', '4'],
      'correctAnswer': 2,
      'userAnswer': null,
    },
    {
      'question': 'Faktor dari x^2 - 4 adalah...',
      'options': ['(x+2)(x-2)', '(x-2)(x-2)', '(x+2)(x+2)', '(x-4)(x+1)'],
      'correctAnswer': 0,
      'userAnswer': null,
    },
    {
      'question': 'Nilai dari 2^3 adalah...',
      'options': ['4', '6', '8', '16'],
      'correctAnswer': 2,
      'userAnswer': null,
    },
    {
      'question': 'Akar kuadrat dari 81 adalah...',
      'options': ['7', '8', '9', '10'],
      'correctAnswer': 2,
      'userAnswer': null,
    },
    {
      'question': 'Hasil dari 15 % 4 adalah...',
      'options': ['0', '1', '2', '3'],
      'correctAnswer': 3,
      'userAnswer': null,
    },
  ];

  void _selectAnswer(int answerIndex) {
    setState(() {
      questions[currentQuestionIndex]['userAnswer'] = answerIndex;
    });
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReviewPage(questions: questions),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} - ${widget.subtitle}'),
        backgroundColor: Colors.blue[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quiz ${currentQuestionIndex + 1}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue[300]),
            ),
            SizedBox(height: 20),
            Text(
              currentQuestion['question'],
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ...List.generate(
              currentQuestion['options'].length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () => _selectAnswer(index),
                  child: Text(currentQuestion['options'][index]),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: currentQuestion['userAnswer'] == index ? Colors.green : Colors.blue,
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: currentQuestion['userAnswer'] != null ? _nextQuestion : null,
                child: Text(currentQuestionIndex == questions.length - 1 ? 'Finish' : 'Next'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}