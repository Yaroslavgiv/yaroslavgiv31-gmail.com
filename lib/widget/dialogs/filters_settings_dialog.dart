import 'package:flutter/material.dart';

filtersSettingsDialog(BuildContext context, TextEditingController controller) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Фильтры'),
          content: (Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Для применения при использовании интеграции с\n Android'),
              TextFormField(controller: controller)
            ],
          )),
        );
      });
}