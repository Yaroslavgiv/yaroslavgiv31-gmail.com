import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Здесь будут ваши задачи', 
        style:  Theme.of(context).textTheme.bodyText1,),
      
      );
  }
}
