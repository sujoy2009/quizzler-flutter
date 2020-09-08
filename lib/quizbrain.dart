import 'package:quizzler/question.dart';

class Quizbrain{
  List<Question>_questionbank=[
    Question(q:'You can lead a cow down stairs but not up stairs.',a:false),
    Question(q:'Approximately one quarter of human bones are in the feet.',a:true),
    Question(q:'A slug\'s blood is green.',a:true),



  ];
  String getques(int ques_num){
    return _questionbank[ques_num].ques;
  }
  bool getans(int ques_num){
    return _questionbank[ques_num].ans;
  }
  int getsize(){
    return _questionbank.length;
  }

}
