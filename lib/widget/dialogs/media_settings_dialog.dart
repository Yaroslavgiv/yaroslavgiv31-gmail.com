import 'package:flutter/material.dart';

mediaSettingsDialog(BuildContext context, TextEditingController controller) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Медиа'),
          content: (Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Кодеки и режим звука во время звонка'),
              TextFormField(controller: controller)
            ],
          )),
        );
      });
}
