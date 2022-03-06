import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siply/providers/quizProvider.dart';
import 'package:siply/views/questions.dart';
import '../colors.dart';

class QuizHome extends StatefulWidget {
  const QuizHome({Key key}) : super(key: key);

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  @override
  void initState() {
    Provider.of<QuizProvider>(context, listen: false).loadQuizInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151D3B),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Container(
          child: Column(
            children: [
              Spacer(),
              Hero(
                tag: 'logo',
                child: Text(
                  "Quiz Mania",
                  style: TextStyle(
                      fontSize: 60,
                      fontFamily: "Berkshire",
                      color: AppColors.textColor),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  "Check your knowladge and show what you got. Just tap on Start button to begin",
                  style: TextStyle(color: AppColors.textColor),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => QuizQuestions()));
                  },
                  child: Text(
                    'START QUIZ',
                    style: TextStyle(
                        color: AppColors.selectedButtonColor,
                        fontSize: 22,
                        fontFamily: "Eczar"),
                  )),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
