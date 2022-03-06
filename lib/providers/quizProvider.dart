import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:siply/models/option.dart';
import 'package:siply/models/question.dart';
import 'package:siply/repo/quiestions_repo.dart';
import 'package:siply/repo/quiz_repo.dart';

class QuizProvider extends ChangeNotifier {
  QuizRepository _quizRepository;
  QuestionsRepository _questionsRepository;
  int _quizId;
  String _currentQuestion;
  List<Option> _currentOptions = [];
  int _currentQuestionIndex = 0;
  bool isQuizEnded = false;

  QuizProvider() {
    _quizRepository = QuizRepository();
    _questionsRepository = QuestionsRepository();
  }

  String get currentQuestion => _currentQuestion;
  List<Option> get currentOptions => _currentOptions;
  int get currentQuestionIndex => _currentQuestionIndex;

  reset() {
    isQuizEnded = false;
    _currentQuestionIndex = 0;
    _quizId = null;
    _quizRepository = null;
    _questionsRepository = null;
    _quizRepository = QuizRepository();
    _questionsRepository = QuestionsRepository();
    _questionsRepository.resetOptions();
  }

  loadQuestion() {
    _currentQuestion =
        _questionsRepository.getQuestion(_quizRepository.current_question_id());
    _currentQuestionIndex = _quizRepository.current_question_id();
    _currentOptions =
        _questionsRepository.getOptions(_quizRepository.current_question_id());
    notifyListeners();
  }

  onTap(int optionId, bool currentState) {
    _questionsRepository.toggle_option_selection(
        _quizRepository.current_question_id(), optionId, currentState);
    notifyListeners();
  }

  int get score => _questionsRepository.score;

  onNextTap() {
    var id = _quizRepository.get_next_question_id();
    _quizRepository.set_current_question(id);
    if (id != -1) {
      loadQuestion();
    } else {
      endQuiz();
    }

    //update Question and options
  }

  endQuiz() {
    isQuizEnded = true;
    notifyListeners();
  }

  onPreviousTap() {
    var id = _quizRepository.get_previous_question_id();
    _quizRepository.set_current_question(id);
    if (id != -1) {
      loadQuestion();
    }
  }

  loadQuizInfo() {
    _quizId = 1;
  }

  startQuiz() {
    _quizRepository.set_current_quiz_id(_quizId);
    loadQuestion();
    // _questionBloc.loadQuestion(0);
  }

  submitQuiz(String quizId) {}
}
