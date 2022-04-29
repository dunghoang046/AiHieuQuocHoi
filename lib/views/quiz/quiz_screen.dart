import 'package:app_aihieuquochoi/views/quiz/components/body_game.dart';
import 'package:flutter/material.dart';
class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      body: BodyGame(),
    );
  }
}
