import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siply/providers/quizProvider.dart';
import 'package:siply/views/quiz_finished.dart';
import 'package:siply/widgets/navigation_button.dart';
import 'package:siply/widgets/option_button.dart';

import '../colors.dart';

class QuizQuestions extends StatefulWidget {
  const QuizQuestions({Key key}) : super(key: key);

  @override
  State<QuizQuestions> createState() => _QuizQuestionsState();
}

class _QuizQuestionsState extends State<QuizQuestions>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation fadeAnimation;
  Animation<Offset> _animationOffset;

  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(controller);
    _animationOffset =
        Tween<Offset>(begin: Offset(-1.0, 1.0), end: Offset(0.0, 1.0))
            .animate(controller);
    controller.forward();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<QuizProvider>(context, listen: false).startQuiz();
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose(); // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      // appBar: AppBar(
      //   title: Text("Quiz Questions"),
      // ),
      body: Consumer<QuizProvider>(builder: (context, provider, child) {
        if (provider.isQuizEnded) {
          return QuizFinished();
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Hero(
                  tag: 'logo',
                  child: Text(
                    "Quiz Mania",
                    style: TextStyle(
                        fontSize: 50,
                        fontFamily: "Berkshire",
                        color: AppColors.textColor),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: LinearProgressIndicator(
                        color: AppColors.buttonColor,
                        backgroundColor: AppColors.textColor,
                        value: (provider.currentQuestionIndex) / 5,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0).animate(controller),
                      child: const Text(
                        "👑",
                        style: TextStyle(fontSize: 35),
                      ),
                    )
                  ],
                ),
                SlideTransition(
                  position: _animationOffset,
                  child: Text(
                    provider.currentQuestion ?? "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Eczar",
                        letterSpacing: 3,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: FadeTransition(
                    opacity: fadeAnimation,
                    child: Column(
                      children: List.generate(
                          provider.currentOptions.length,
                          (index) => ListTile(
                                title: OptionButton(
                                  optionIndex: index,
                                  onTap: () {
                                    provider.onTap(
                                        index + 1,
                                        provider
                                            .currentOptions[index].selected);
                                  },
                                  isTapped:
                                      provider.currentOptions[index].selected,
                                  option: provider
                                      .currentOptions[index].option_info,
                                ),
                              )),
                    ),
                  ),
                ),
                Spacer(),
                NavigationButton(
                  onBackPress: () {
                    provider.onPreviousTap();
                    controller.reset();
                    controller.forward();
                  },
                  onForwardPress: () {
                    provider.onNextTap();
                    controller.reset();
                    controller.forward();
                  },
                ),
                Spacer(),
              ],
            ),
          );
        }
      }),
    );
  }
}
