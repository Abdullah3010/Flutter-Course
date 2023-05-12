import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({
    required this.score,
    super.key,
  });
  final int score;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Score Screen'),
      ),
      body: Center(
        child: Text('your score is $score'),
      ),
    );
  }
}
