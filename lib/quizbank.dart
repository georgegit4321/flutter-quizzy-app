import 'question.dart';

class QuizBank{

  int _qnum = 0;

  List<Question> _QBank = [
    Question(q: 'question 1' , a: true),
    Question(q: 'question 2' , a: false),
    Question(q: 'question 3' , a: true),
  ];
  String getqn(){
    return _QBank[_qnum].question;
  }
  bool getans(){
    return _QBank[_qnum].answer;
  }
  void add(){
    _qnum = (_qnum + 1)%_QBank.length;
  }
  int getqnum(){
    return _qnum;
  }
}