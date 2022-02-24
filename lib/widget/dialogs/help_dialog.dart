import 'package:flutter/material.dart';

helpDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.help_outline),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Помощь",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ]),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Tel version:1.1.2 r2595',
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {},
                  ),
                  const Text(
                      'Остановите запись лога\n (опционально отправить)'),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.dialer_sip),
                    onPressed: () {},
                  ),
                  const Text('Обновить'),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ОТМЕНА'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}