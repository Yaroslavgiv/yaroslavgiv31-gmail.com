import 'package:flutter/material.dart';
import 'fastSettingsDialog.dart';

class SettingSettings extends StatefulWidget {
  const SettingSettings({Key? key}) : super(key: key);

  @override
  _SettingSettingsState createState() => _SettingSettingsState();
}

class _SettingSettingsState extends State<SettingSettings> {

  List<String> settings = [
    'Быстрая настройка',
    'Сеть',
    'Медиа',
    'Пользовательский интерфейс',
    'Параметры звонков',
    'Фильтры',
  ];
  List<Icon> iconData = [
    Icon(Icons.mode_outlined),
    Icon(Icons.rss_feed),
    Icon(Icons.volume_down_rounded),
    Icon(Icons.android_outlined),
    Icon(Icons.phone),
    Icon(Icons.filter_alt_outlined),
  ];
  List<String> subtitle = [
    'Минимальный набор опций для тех, кто не знает\n принципов работы SIP',
    'Как SIP работает с сетью',
    'Кодеки и режим звука во время звонка',
    'Настройки пользовательского интерфейса',
    'Параметры, связанные со звонками',
    'Для применения при использовании интеграции с\n Android',
  ];


  final _settingsController = TextEditingController();
  final _webSettingsController = TextEditingController();
  final _mediaSettingsController = TextEditingController();
  final _userSettingsController = TextEditingController();
  final _callsSettingsController = TextEditingController();
  final _filtrsSettingsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: settings.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: iconData[index],
                        title: Text(settings[index]),
                        subtitle: Text(subtitle[index]),
                        onTap: () {
                          switch (index) {
                            case 0:
                               settingsDialog(context);
                              break;
                            case 1:
                              webSettingsDialog(context);
                              break;
                            case 2:
                              mediaSettingsDialog(context);
                              break;
                            case 3:
                              userInterfaseSettingsDialog(context);
                              break;
                            case 4:
                              callsSettingsDialog(context);
                              break;
                            case 5:
                              filtrsSettingsDialog(context);
                              break;
                          }
                        },
                      ),
                      Divider(
                        color: Colors.white,
                      )
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ],
        ),
      ),
    );
  }

  settingsDialog(BuildContext context) {
    return fastSettingsDialog(context);
  }

  webSettingsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Сеть'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Как SIP работает с сетью'),
                TextFormField(controller: _webSettingsController)
              ],
            ),
          );
        });
  }

  mediaSettingsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Медиа'),
            content: (Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Кодеки и режим звука во время звонка'),
                TextFormField(controller: _mediaSettingsController)
              ],
            )),
          );
        });
  }

  userInterfaseSettingsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Пользовательский интерфейс'),
            content: (Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Настройки пользовательского интерфейса'),
                TextFormField(controller: _userSettingsController)
              ],
            )),
          );
        });
  }

  callsSettingsDialog(BuildContext context) {
    const Icon(Icons.phone);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Параметры звонков'),
            content: (Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Параметры, связанные со звонками'),
                TextFormField(controller: _callsSettingsController)
              ],
            )),
          );
        });
  }

  filtrsSettingsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Фильтры'),
            content: (Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Для применения при использовании интеграции с\n Android'),
                TextFormField(controller: _filtrsSettingsController)
              ],
            )),
          );
        });
  }
}
