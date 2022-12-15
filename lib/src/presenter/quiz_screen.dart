import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/quiz-fundo.png',),fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                child: Image.asset('images/logo-play.png',fit: BoxFit.cover,)),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:30.0),
                  child: Image.asset('images/geracao-samuel.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:30.0),
                  child: Image.asset('images/criancas.png'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
