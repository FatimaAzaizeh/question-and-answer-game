import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget {
  ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('اختبار'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerResult = [];
  int rightAnswer = 0;
  void checkAnswer(bool whatUserPicked) {
    bool correctAnswer = appBrain.getQuestionAnswer();
    setState(() {
      if (correctAnswer == whatUserPicked) {
        rightAnswer++;
        answerResult.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
      } else {
        answerResult.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        ));
      }

      if (appBrain.isFinished() == true) {
        Alert(
          context: context,
          title: "إنتهاء الاختبار",
          desc: "لقد اجبت على $rightAnswer من أسئلة صحيخة من اصل 7",
          buttons: [
            DialogButton(
              child: Text(
                "أبدا من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        appBrain.reset();
        answerResult = [];
        rightAnswer = 0;
      }
      appBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
            flex: 5,
            child: Column(
              children: [
                Image.asset(appBrain.getQuestionImage()),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  appBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                )
              ],
            )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.indigo,
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: Text('صح')),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepOrange),
              onPressed: () {
                checkAnswer(false);
              },
              child: Text('خطأ')),
        ))
      ],
    );
  }
}
