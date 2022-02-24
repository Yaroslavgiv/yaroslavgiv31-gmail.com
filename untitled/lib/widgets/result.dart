import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int count;
  final int total;
  final Function onClearState;

  Result({Key key, this.count, this.total, this.onClearState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String msg = '';
    Widget img;

    if (0 <= count && count <= 2) {
      msg = 'Не переживай\n логику тоже можно натренеровать!';
      img = Image.asset('assets/images/bad.png');
    } else if ((3 <= count && count <= 6)) {
      msg = 'Средний был не так не сяк!';
      img = Image.asset('assets/images/soydet.png');
    } else {
      msg = 'Вам надо в программисты!';
      img = Image.asset('assets/images/good.png');
    }

    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 15.0,
            spreadRadius: 0.0,
            offset: Offset(
              2.0,
              5.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(30.0),
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF5337ff),
            Color(0xFF8131ff),
            Color(0xFFbd27ff),
          ],
        ),
      ),
      child: Column(
        children: <Widget> [
          Container(
            width: 120,
            height: 120,
            child: FittedBox(
              fit: BoxFit.contain,
              child: img,
            ),
          ),
          Container(
            child: Text(
              msg,
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Text(
            'Верно ответил на $count из $total',
          ),
          Divider(
            color: Colors.white,
          ),
          FlatButton(
            child: Text(
              'Пройти ещё раз!',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 22,
              ),

            ),
            onPressed: onClearState,
          )
        ],
      ),
    );
  }
}
