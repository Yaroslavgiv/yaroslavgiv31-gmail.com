import 'package:flutter/material.dart';
import 'package:telsip/linphonekotlininterface.dart';
offConnectionDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ПРЕДУПРЕЖДЕНИЕ'),
          titlePadding: const EdgeInsets.fromLTRB(15, 15, 0, 10),
          content: const Text(
              'Приложение настроено так, чтобы быть доступным для этой сети!'
                  ' После нажатия кнопки ОК Вы не будете доступны до следующего запуска приложения'),
          contentPadding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
          actions: [
            TextButton(
              child: const Text('ОТМЕНА'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('ОК'),
              onPressed: () {
                linphoneKotlinInterface.instance.stop_service({});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}