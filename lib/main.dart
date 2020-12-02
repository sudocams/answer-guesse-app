import 'package:First_App/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
   static const _questions = [
      {'questionText':'what is your favorite animal?',
       'answers':[{'text':'dog' ,'score': 10},{'text':'cow', 'score': 4},{'text':'snake','score':7}],},

      {'questionText':'what is your favourite meal?', 
      'answers':[{'text':'choma', 'score':10},{'text':'canned', 'score':4},{'text':'sweet potato', 'score':7}],},

      {'questionText':'how about towns , which is yours?',
       'answers':[{'text':'Nairobi', 'score':10},{'text':'Kisumu','score':7},{'text':'Mombasa','score':6}],},

      {'questionText':'neighbouring country?', 
      'answers':[{'text':'USA', 'score':10},{'text':'Egypt', 'score':3}, {'text':'India', 'score':3}],},
    ];

  var _questionsIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionsIndex = 0;
      _totalScore = 0;
    });
   
  }

  void _answerQuestion(int score){

    _totalScore = _totalScore + score;
    
    setState(() {
       _questionsIndex = _questionsIndex + 1;
    });
    if ( _questionsIndex < _questions.length) {
      print('we have more question');
    }else{
      print('no more questions');
    }
  }
  
  @override
  Widget build(BuildContext context){
    
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('My First App')),
      body:  _questionsIndex < _questions.length 
      ? Quiz(answerQuestion: _answerQuestion, questionIndex: _questionsIndex, questions: _questions) 
      :Result(_totalScore, _resetQuiz),
    ),);
  }
}
