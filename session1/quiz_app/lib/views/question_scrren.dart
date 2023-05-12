import 'package:flutter/material.dart';
import 'package:quiz_app/model/question_model.dart';
import 'package:quiz_app/views/score_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<QuestionModel> questions = [
    QuestionModel(
      questionName: '2 * 2 = ?',
      answers: ['4', '5', '6', '7'],
      correctAnswer: '4',
    ),
    QuestionModel(
      questionName: '3 * 2 = ?',
      answers: ['4', '5', '6', '7'],
      correctAnswer: '6',
    ),
    QuestionModel(
      questionName: '2 * 4 = ?',
      answers: ['4', '5', '6', '8'],
      correctAnswer: '8',
    ),
  ];
//   List<String> q = [
//     '2 * 2 = ?',
//     '3 * 3 = ?',
//     '4 * 4 = ?',
//     '5 * 5 = ?',
//   ];
// //a[currenQ] = ['4', '5', '6', '7']
//   List<List<String>> a = [
//     ['4', '5', '6', '7'],
//     ['6', '7', '8', '9'],
//     ['8', '9', '16', '11'],
//     ['10', '11', '25', '13'],
//   ];
//   List<String> correctAnswer = [
//     '4',
//     '9',
//     '16',
//     '25',
//   ];

  int currentQ = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Question Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Question
            Text(questions[currentQ].questionName),
            //Answers
            SizedBox(
              height: 200,
              width: 120,
              child: ListView.builder(
                itemCount: questions[currentQ].answers.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      if (questions[currentQ].answers[index] == questions[currentQ].correctAnswer) {
                        if (currentQ == questions.length - 1) {
                          score += 10;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ScoreScreen(
                                  score: score,
                                );
                              },
                            ),
                          );
                        } else {
                          setState(() {
                            score += 10;
                            currentQ++;
                          });
                        }
                      } else {
                        setState(() {
                          currentQ++;
                        });
                      }
                    },
                    child: Text(questions[currentQ].answers[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
