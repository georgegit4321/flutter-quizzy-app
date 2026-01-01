import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'question.dart';
import 'quizbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


void main() {
  runApp(Quizzy());
}

class Quizzy extends StatelessWidget {
  const Quizzy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> Scorekeeper = [
    SizedBox(width: 3, height: 24)
    //u can put List<Icon> as well
    /*Icon(Icons.done, color: Colors.green),
    Icon(Icons.clear, color: Colors.red),*/
  ];
  int score=0;

  void checkAnswer(bool UserAns){
    if (UserAns==obj.getans()){
      Scorekeeper.add(Icon(Icons.done, color: Colors.green));
      score++;
    }
    else{
      Scorekeeper.add(Icon(Icons.clear, color: Colors.red));
    }
    if(obj.is_completed()){
      Alert(
        context: context,
        title: 'Finished',
        desc: 'score : $score',
      ).show();

      obj.reset();
      Scorekeeper = [SizedBox(width: 3, height: 24)];
      score=0;
    }
    setState(() {
      obj.add();
    });
  }

  // List<String> questions = ["question 1", 'question 2', 'question 3'];
  // List<String> answers = ['True', 'False', 'True'];

  // Question obj = Question(q: 'xcvxcv', a: true);
  QuizBank obj = QuizBank();



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Text(
                obj.getqn(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Row(children: Scorekeeper),
      ],
    );
  }
}
