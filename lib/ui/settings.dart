import 'package:flutter/material.dart';
import 'package:telsip/widget/dialogs/call_settings_dialog.dart';
import 'package:telsip/widget/dialogs/fast_settings_dialog.dart';
import 'package:telsip/widget/dialogs/filters_settings_dialog.dart';
import 'package:telsip/widget/dialogs/media_settings_dialog.dart';
import 'package:telsip/widget/dialogs/user_interface_settings_dialog.dart';
import 'package:telsip/widget/dialogs/web_settings_dialog.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  List<String> settings = [
    'Быстрая настройка',
    'Сеть',
    'Медиа',
    'Пользовательский интерфейс',
    'Параметры звонков',
    'Фильтры',
  ];

  List<String> subtitle = [
    'Минимальный набор опций для тех, кто не знает\n принципов работы SIP',
    'Как SIP работает с сетью',
    'Кодеки и режим звука во время звонка',
    'Настройки пользовательского интерфейса',
    'Параметры, связанные со звонками',
    'Для применения при использовании интеграции с\n Android',
  ];

  Icon _getIconData(BuildContext context, int index){
          List<Icon> iconData = [
    Icon(Icons.mode_outlined, color: Theme.of(context).iconTheme.color,),
    Icon(Icons.rss_feed, color: Theme.of(context).iconTheme.color,),
    Icon(Icons.volume_down_rounded, color: Theme.of(context).iconTheme.color,),
    Icon(Icons.android_outlined, color: Theme.of(context).iconTheme.color,),
    Icon(Icons.phone, color: Theme.of(context).iconTheme.color,),
    Icon(Icons.filter_alt_outlined, color: Theme.of(context).iconTheme.color,),
  ];
    return iconData[index];
  }

  final _webSettingsController = TextEditingController();
  final _mediaSettingsController = TextEditingController();
  final _userSettingsController = TextEditingController();
  final _callsSettingsController = TextEditingController();
  final _filtersSettingsController = TextEditingController();

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
                        leading: _getIconData(context, index),
                        title: Text(
                          settings[index],
                          style: Theme.of(context).textTheme.headline6,
                          ),
                        subtitle: Text(subtitle[index],
                        style: Theme.of(context).textTheme.bodyText1,
                        ),
                        onTap: () {
                          switch (index) {
                            case 0:
                               // _fastSettingsDialog(context);//вернуть
                              break;
                            case 1:
                              // _webSettingsDialog(context, _webSettingsController); //вернуть
                              break;
                            case 2:
                              // _mediaSettingsDialog(context, _mediaSettingsController); //вернуть
                              break;
                            case 3:
                              // _userInterfaceSettingsDialog(context, _userSettingsController); //вернуть
                              break;
                            case 4:
                              // _callsSettingsDialog(context, _callsSettingsController); //вернуть
                              break;
                            case 5:
                              // _filtersSettingsDialog(context, _filtersSettingsController ); //вернуть
                              break;
                          }
                        },
                      ),
                      const Divider(
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

  _fastSettingsDialog(BuildContext context) {
    return fastSettingsDialog(context);
  }

  _webSettingsDialog(BuildContext context, TextEditingController controller) {
    return webSettingsDialog(context, controller);
  }

  _mediaSettingsDialog(BuildContext context, TextEditingController controller) {
    return mediaSettingsDialog(context, controller);
  }

  _userInterfaceSettingsDialog(BuildContext context, TextEditingController controller) {
    return userInterfaceSettingsDialog(context, controller);
  }

  _callsSettingsDialog(BuildContext context, TextEditingController controller) {
    return callsSettingsDialog(context, controller);
  }

  _filtersSettingsDialog(BuildContext context, TextEditingController controller) {
    return filtersSettingsDialog(context, controller);
  }

  @override
  void dispose() {
    super.dispose();
    _callsSettingsController.dispose();
    _filtersSettingsController.dispose();
    _mediaSettingsController.dispose();
    _userSettingsController.dispose();
    _webSettingsController.dispose();
  }
}
