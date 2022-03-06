import 'package:siply/models/option.dart';
import 'package:siply/models/question.dart';

class QuestionsRepository {
  int score = 0;
  static Map<int, Question> question_map = {
    1: Question(
        1,
        [
          Option(1, 'inifinty'),
          Option(2, '2022 years'),
          Option(3, '2022 years'),
          Option(4, '2022 years')
        ],
        'How old is this Universe?',
        2),
    2: Question(
        2,
        [
          Option(1, '2022 years'),
          Option(2, '2022 years'),
          Option(3, '2022 years'),
          Option(4, '2022 years')
        ],
        'King of fruits? ',
        2),
    3: Question(
        3,
        [
          Option(1, 'inifinty'),
          Option(2, '2022 years'),
          Option(3, '2022 years'),
          Option(4, '2022 years')
        ],
        'King of vegies ',
        2),
    4: Question(
        4,
        [
          Option(1, 'inifinty'),
          Option(2, '2022 years'),
          Option(3, '2022 years'),
          Option(4, '2022 years')
        ],
        'King of vegies ',
        2),
    5: Question(
        5,
        [
          Option(1, 'inifinty'),
          Option(2, '2022 years'),
          Option(3, '2022 years'),
          Option(4, '2022 years')
        ],
        'King of vegies ',
        2)
  };
  String getQuestion(int question_id) {
    return question_map[question_id].question_info;
  }

  List<Option> getOptions(int question_id, {bool reset = false}) {
    return question_map[question_id].options;
  }

  bool toggle_option_selection(
      int question_id, int option_id, bool current_selected_state) {
    Option option = question_map[question_id]
        .options
        .firstWhere((opt) => opt.option_id == option_id);
    if (question_map[question_id].correctOptionId == option_id &&
        current_selected_state == false) {
      score++;
    } else if (question_map[question_id].correctOptionId == option_id &&
        current_selected_state == true) {
      score--;
    }
    return option.set_selection_state(!current_selected_state);
  }
}
