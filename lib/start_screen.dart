import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF203ba6), Color(0xFF161616), Color(0xFF020202)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                width: 400,
                colorBlendMode: BlendMode.srcIn,
                color: Colors.white,
                filterQuality: FilterQuality.high,
              ),
              const SizedBox(height: 40),
              Text(
                'Bounty Hunter?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'FjallaOne',
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF500DAD),
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'FjallaOne',
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(200, 40),
                ),
                icon: Icon(Icons.arrow_right_alt, color: Colors.white),
                label: Text(
                  'Start Hunt',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: startQuiz,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
