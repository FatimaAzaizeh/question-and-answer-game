import 'question.dart';

class AppBrain {
  int _questionNumber = 0;

  List<Question> _questionGroup = [
    Question(
        questionText: 'عدد الكواكب في المجموعة الشمسية هو ثماني كواكب',
        questionImage: 'images/image-1.jpg',
        questionAnswer: true),
    Question(
      questionText: 'القطط هي حيوان لاحمة',
      questionImage: 'images/image-2.jpg',
      questionAnswer: true,
    ),
    Question(
      questionText: 'الصين موجودة في الفارة الافريقية',
      questionImage: 'images/image-3.jpg',
      questionAnswer: false,
    ),
    Question(
      questionText: 'الارض مسطحة وليست كروية ',
      questionImage: 'images/image-4.jpg',
      questionAnswer: false,
    ),
    Question(
      questionText: 'باستطاعة الانسان البقاء على قيد الحياة بدون اكل اللحوم',
      questionImage: 'images/image-5.jpg',
      questionAnswer: true,
    ),
    Question(
      questionText: 'الشمس تدور حول الارض والارض تدور حول القمر',
      questionImage: 'images/image-6.jpg',
      questionAnswer: false,
    ),
    Question(
      questionText: 'الحيوانات لا تشعر بالالم',
      questionImage: 'images/image-7.jpg',
      questionAnswer: false,
    ),
  ];

  String getQuestionText() {
    return _questionGroup[_questionNumber].questionText;
  }

  String getQuestionImage() {
    return _questionGroup[_questionNumber].questionImage;
  }

  bool getQuestionAnswer() {
    return _questionGroup[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionGroup.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= _questionGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
