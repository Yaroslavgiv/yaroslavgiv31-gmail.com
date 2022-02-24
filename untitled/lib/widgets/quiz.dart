import 'package:flutter/material.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final index;
  final questionData;
  final onChangeAnswer;

  Quiz({Key key,
    this.index,
    this.questionData,
    this.onChangeAnswer
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            questionData.questions[index].title,
          ),
        ),
        ...questionData.questions[index].answers
            .map((value) => Answer(
                  title: value['answer'],
                  onChangeAnswer: onChangeAnswer,
                  isCorrect: value.containsKey('isCorrect') ? true : false,
                ))
            .toList(),
      ],
    );
  }
}
