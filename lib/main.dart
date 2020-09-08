import 'dart:io';

import 'package:flutter/material.dart';

import 'package:quizzler/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
Quizbrain quizbrain=Quizbrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scorepicker=[];
  /*
  List<String> ques=[
    'You can lead a cow down stairs but not up stairs.',
        'Approximately one quarter of human bones are in the feet.',
        'A slug\'s blood is green.'
  ];
  Question q1=Question(q:'jgjgjjkk ,jkkjg',a:true);
  List<bool> ans=[
    false,
    true,
    true
  ];

   */
  //OOP

  int ques_serial=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
               quizbrain.getques(ques_serial),

                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                if(quizbrain.getans(ques_serial)==true){
                  setState(() {

                    if(quizbrain.getsize()-1>ques_serial){
                      scorepicker.add(Icon(Icons.check,color: Colors.green,));
                      ques_serial++;

                    }
                    else{
                      sleep(new Duration(seconds: 10));
                      scorepicker.add(Icon(Icons.check,color: Colors.green,));
                      scorepicker.clear();

                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "End",
                        desc: "restart the quiz azzain",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "COOL",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }
                            ,
                            width: 120,
                          )
                        ],
                      ).show();
                      ques_serial=0;


                    }

                  });

                }
                else{
                  setState(() {

                    if(quizbrain.getsize()-1>ques_serial){
                      scorepicker.add(Icon(Icons.close,color: Colors.red,));
                      ques_serial++;

                    }
                    else{
                      sleep(new Duration(seconds: 10));
                      scorepicker.add(Icon(Icons.close,color: Colors.red,));
                    scorepicker.clear();

                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "End",
                        desc: "restart the quiz azzain",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "COOL",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }
                            ,
                            width: 120,
                          )
                        ],
                      ).show();

                      ques_serial=0;


                    }

                  });

                }


                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if(quizbrain.getans(ques_serial)==false){
                  setState(() {

                    if(quizbrain.getsize()-1>ques_serial){
                      scorepicker.add(Icon(Icons.check,color: Colors.green,));
                      ques_serial++;

                    }
                    else{
                      scorepicker.add(Icon(Icons.check,color: Colors.green,));
                      ques_serial=0;
                      scorepicker.clear();
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "Ended",
                        desc: "restaert now.",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "COOL",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          )
                        ],
                      ).show();
                    }


                  });

                }
                else{
                  setState(() {

                    if(quizbrain.getsize()-1>ques_serial){
                      scorepicker.add(Icon(Icons.close,color: Colors.red,));
                      ques_serial++;

                    }
                    else{
                      scorepicker.add(Icon(Icons.close,color: Colors.red,));
                      ques_serial=0;
                      scorepicker.clear();
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "End",
                        desc: "restart the quiz azzain",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "COOL",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }
                            ,
                            width: 120,
                          )
                        ],
                      ).show();

                    }

                  });

                }
                //The user picked false.
              },
            ),
          ),
        ),
      Row(
        children: scorepicker,
      )

      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
