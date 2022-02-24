import 'package:flutter/material.dart';

webSettingsDialog(BuildContext context, TextEditingController controller) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Сеть'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Как SIP работает с сетью'),
              TextFormField(controller: controller),
            ],
          ),
        );
      });
}
