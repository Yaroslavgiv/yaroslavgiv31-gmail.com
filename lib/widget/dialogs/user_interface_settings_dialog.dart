import 'package:flutter/material.dart';

userInterfaceSettingsDialog(BuildContext context, TextEditingController controller) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Пользовательский интерфейс'),
          content: (Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Настройки пользовательского интерфейса'),
              TextFormField(controller: controller)
            ],
          )),
        );
      });
}