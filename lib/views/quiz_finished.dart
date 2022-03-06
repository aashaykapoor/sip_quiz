import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siply/colors.dart';
import 'package:siply/providers/quizProvider.dart';
import 'package:siply/views/quiz_home.dart';

class QuizFinished extends StatelessWidget {
  const QuizFinished({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: Column(
        children: [
          Spacer(),
          Center(
            child: Text(
              "Quiz Over",
              style: TextStyle(
                  color: AppColors.textColor,
                  fontFamily: 'Berkshire',
                  fontSize: 60),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Your total score is  ${Provider.of<QuizProvider>(context).score}",
            style: TextStyle(color: AppColors.buttonColor, fontSize: 20),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              Provider.of<QuizProvider>(context, listen: false).reset();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => QuizHome()));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.buttonColor,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
                child: Text(
                  'Retake Quiz',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
            ),
          ),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}
