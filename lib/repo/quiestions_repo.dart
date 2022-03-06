import 'package:siply/models/option.dart';
import 'package:siply/models/question.dart';

class QuestionsRepository {
  int score = 0;
  static Map<int, Question> question_map = {
    1: Question(
        1,
        [Option(1, '5'), Option(2, '6'), Option(3, '7'), Option(4, '9')],
        'How many continents in the world?',
        3),
    2: Question(
        2,
        [
          Option(1, 'Windows'),
          Option(2, 'iOS'),
          Option(3, 'Linux'),
          Option(4, 'Android')
        ],
        'Apple owns which OS?',
        2),
    3: Question(
        3,
        [
          Option(1, 'Pune'),
          Option(2, 'Nagpur'),
          Option(3, 'Mumbai'),
          Option(4, 'Nasik')
        ],
        'Capital of Maharashtra? ',
        3),
    4: Question(
        4,
        [
          Option(1, 'South America'),
          Option(2, 'Europe'),
          Option(3, 'Asia'),
          Option(4, 'Australia')
        ],
        'Spain is in which continent?',
        2),
    5: Question(
        5,
        [
          Option(1, 'Apple'),
          Option(2, 'Guava'),
          Option(3, 'Mango'),
          Option(4, 'Orange')
        ],
        'King of fruits? ',
        3)
  };
  String getQuestion(int question_id) {
    return question_map[question_id].question_info;
  }

  List<Option> getOptions(int question_id, {bool reset = false}) {
    return question_map[question_id].options;
  }

  resetOptions() {
    for (var q in question_map.entries) {
      for (var i in q.value.options) {
        i.selected = false;
      }
    }
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
    for (var i in question_map[question_id].options) {
      if (i.option_id != option_id) {
        i.set_selection_state(false);
      }
    }
    return option.set_selection_state(!current_selected_state);
  }
}
