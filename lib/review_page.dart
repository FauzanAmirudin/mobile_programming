import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  final List<Map<String, dynamic>> questions;

  const ReviewPage({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    int correctAnswers = questions.where((q) => q['userAnswer'] == q['correctAnswer']).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Review'),
        backgroundColor: Colors.blue[300],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Score: $correctAnswers / ${questions.length}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue[300]),
              ),
              const SizedBox(height: 20),
              ...questions.asMap().entries.map((entry) {
                int index = entry.key;
                var question = entry.value;
                bool isCorrect = question['userAnswer'] == question['correctAnswer'];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Question ${index + 1}: ${question['question']}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Your answer: ${question['options'][question['userAnswer']]}',
                        style: TextStyle(
                          fontSize: 16,
                          color: isCorrect ? Colors.green : Colors.red,
                        ),
                      ),
                      if (!isCorrect)
                        Text(
                          'Correct answer: ${question['options'][question['correctAnswer']]}',
                          style: const TextStyle(fontSize: 16, color: Colors.green),
                        ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('Back to Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}