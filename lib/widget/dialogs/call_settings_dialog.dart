import 'package:flutter/material.dart';

callsSettingsDialog(BuildContext context, TextEditingController controller) {
  const Icon(Icons.phone);
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Параметры звонков'),
          content: (Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Параметры, связанные со звонками'),
              TextFormField(controller: controller)
            ],
          )),
        );
      });
}
