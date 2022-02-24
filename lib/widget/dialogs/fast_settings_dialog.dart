import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

fastSettingsDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Быстрая настройка'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ListTile(
                title: Text('Интегрировать с Андроид'),
                subtitle: Text(
                    'Интеграция со стандартными номеронабирателем и списком вызовов'),
              ),
              const Text('ПРОФИЛЬ ДОСТУПНОСТИ'),
              const Divider(),
              const ListTile(
                title: Text('Всегда доступен'),
                subtitle: Text('Входящие вызовы всегда принимаются'),
              ),
              const ListTile(
                title: Text('Доступен при WiFi соединении'),
                subtitle: Text(
                    'Доступен для входящих вызовов только при WiFi соединении'),
              ),
              const ListTile(
                title: Text('Доступны только исходящие вызовы'),
                subtitle:
                    Text('Активировать SIP-клиент автоматически при вызовах'),
              ),
              const Text('ПЕРЕДАЧА ЧЕРЕЗ СОТОВУЮ СВЯЗЬ'),
              const Divider(),
              // ListTile(
              //   title: Text('Я могу использовать сотовую связь для SIP'),
              //   subtitle: Text('Передача VoIP пакетов должна быть разрешена сотовым оператором'),
              // ),

              CheckboxListTile(
                title: const Text('Я могу использовать сотовую связь для SIP'),
                subtitle: const Text(
                    'Передача VoIP пакетов должна быть разрешена сотовым оператором'),
                value: timeDilation != 1.0,
                onChanged: (bool? value) {},
                //secondary: const Icon(Icons.hourglass_empty),
              ),

              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(90, 10, 90, 10),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 14),
                  backgroundColor: Colors.grey,
                ),
                onPressed: () {},
                child: const Text('СОХРАНИТЬ'),
              ),
            ],
          ),
        );
      });
}