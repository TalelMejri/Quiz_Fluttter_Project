 import 'package:quiz_flutter/Question.dart';

class appBrain{
int _numberQuestion=0;

final List<Question> _questiongroup=[
    Question(q: "test",i: "images/image-1.jpg",a: true),
    Question(q: "test2",i: "images/image-2.jpg",a: false),
    Question(q: "test3",i: "images/image-3.jpg",a: true),
    Question(q: "test4",i: "images/image-4.jpg",a: false)
  ];


void nextQuestion(){
  if(_numberQuestion <_questiongroup.length-1){
    _numberQuestion++;
  }
}

String TestQuestionj(){
  return _questiongroup[_numberQuestion].questionText;
}

String ImageQuestion(){
  return _questiongroup[_numberQuestion].questionImage;
}

bool AnswerQuestion(){
  return _questiongroup[_numberQuestion].questionAnswer;
}
}
