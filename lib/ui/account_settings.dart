import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telsip/theme.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  void initState() {
    super.initState();
    getAccount();
  }

  setAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name!);
    prefs.setString('user', user!);
    prefs.setString('server', server!);
    prefs.setString('password', password!);
  }

  getAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name');
      user = prefs.getString('user');
      server = prefs.getString('server');
      password = prefs.getString('password');
    });
  }

  final _nameController = TextEditingController();
  final _userController = TextEditingController();
  final _serverController = TextEditingController();
  final _passwordController = TextEditingController();

  String? name;
  String? user;
  String? server;
  String? password;
  bool hidePassword = true;
  String valueText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 10),
                    title: name != null
                        ? Text(
                            'Название аккаунта',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        : const Text(
                            'Название аккаунта',
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                    subtitle: name != null
                        ? Text(
                            name!,
                            style: Theme.of(context).textTheme.headline6,
                          )
                        : const Text(
                            'Отображаемое название аккаунта',
                            style: TextStyle(color: Colors.orange),
                          ),
                    onTap: () {
                      if (name != null) {
                        _nameController.text = name!;
                        nameAccountDialog(context);
                      } else {
                        nameAccountDialog(context);
                      }
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 10),
                    title: user != null
                        ? Text(
                            'Пользователь',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        : const Text(
                            'Пользователь',
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                    subtitle: user != null
                        ? Text(
                            user!,
                            style: Theme.of(context).textTheme.headline6,
                          )
                        : const Text(
                            'Имя пользователя / логин (без @sip.server)',
                            style: TextStyle(color: Colors.orange),
                          ),
                    onTap: () {
                      if (user != null) {
                        _userController.text = user!;
                        userDialog(context);
                      } else {
                        userDialog(context);
                      }
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 10),
                    title: server != null
                        ? Text(
                            'Сервер',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        : const Text(
                            'Сервер',
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                    subtitle: server != null
                        ? Text(
                            server!,
                            style: Theme.of(context).textTheme.headline6,
                          )
                        : const Text(
                            'SIP сервер домен/IP[:порт]',
                            style: TextStyle(color: Colors.orange),
                          ),
                    onTap: () {
                      if (server != null) {
                        _serverController.text = server!;
                        serverDialog(context);
                      } else {
                        serverDialog(context);
                      }
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 10),
                    title: password != null
                        ? Text(
                            'Пароль',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        : const Text(
                            'Пароль',
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                    subtitle: password != null
                        ? Text(
                            '*' * password!.length,
                            style: Theme.of(context).textTheme.headline6,
                          )
                        : const Text(
                            'Пароль доступа к аккаунту',
                            style: TextStyle(color: Colors.orange),
                          ),
                    onTap: () {
                      if (password != null) {
                        _passwordController.text = password!;
                        passwordDialog(context);
                      } else {
                        passwordDialog(context);
                      }
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ],
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                    child: Text(
                      'Отмена',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    onPressed: () async {
                      Navigator.of(context).maybePop();
                    },
                  ),
                  TextButton(
                    child: user != null &&
                            name != null &&
                            server != null &&
                            password != null
                        ? Text(
                            'Сохранить',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        : Text(
                            'Сохранить',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                    onPressed: user != null &&
                            name != null &&
                            server != null &&
                            password != null
                        ? () async {
                            setAccount();
                            Navigator.of(context).maybePop();
                          }
                        : null,
                  ),
                ]),
          ],
        ),
      ),
    );
  }

  Future nameAccountDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: const Text('Название аккаунта'),
            content: (Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Отображаемое название аккаунта',
                    style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  controller: _nameController,
                  onChanged: (value) => valueText = value,
                ),
              ],
            )),
            actions: [
              TextButton(
                child: Text('ОТМЕНА',
                    style: Theme.of(context).textTheme.bodyText1),
                onPressed: () {
                  valueText = "";
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('ОК', style: Theme.of(context).textTheme.bodyText1),
                onPressed: () {
                  valueText != "" ? name = valueText : null;
                  valueText = "";
                  if (name == "") {
                    setState(() {
                      name = null;
                      Navigator.of(context).pop();
                    });
                  } else {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  }
                },
              ),
            ],
          );
        });
  }

  Future userDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: const Text('Пользователь'),
            content: (Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Имя пользователя / логин (без @sip.server)',
                    style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  controller: _userController,
                  onChanged: (value) => valueText = value,
                ),
              ],
            )),
            actions: [
              TextButton(
                child: Text(
                  'ОТМЕНА',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onPressed: () {
                  valueText = "";
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  'ОК',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onPressed: () async {
                  valueText != "" ? user = valueText : null;
                  valueText = "";
                  if (user == "") {
                    setState(() {
                      user = null;
                      Navigator.of(context).pop();
                    });
                  } else {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  }
                },
              ),
            ],
          );
        });
  }

  Future serverDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: const Text('Сервер'),
            content: (Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('SIP сервер домен/IP[:порт]',
                    style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  controller: _serverController,
                  onChanged: (value) => valueText = value,
                ),
              ],
            )),
            actions: [
              TextButton(
                child: Text('ОТМЕНА',
                    style: Theme.of(context).textTheme.bodyText1),
                onPressed: () {
                  valueText = "";
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('ОК', style: Theme.of(context).textTheme.bodyText1),
                onPressed: () {
                  valueText != "" ? server = valueText : null;
                  valueText = "";
                  if (server == "") {
                    setState(() {
                      server = null;
                      Navigator.of(context).pop();
                    });
                  } else {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  }
                },
              ),
            ],
          );
        });
  }

  Future passwordDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: const Text('Пароль'),
            content: (Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Пароль доступа к аккаунту',
                    style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  controller: _passwordController,
                  onChanged: (value) => valueText = value,
                  obscureText: hidePassword,
                ),
              ],
            )),
            actions: [
              TextButton(
                child: Text('ОТМЕНА',
                    style: Theme.of(context).textTheme.bodyText1),
                onPressed: () {
                  valueText = "";
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('ОК', style: Theme.of(context).textTheme.bodyText1),
                onPressed: () {
                  valueText != "" ? password = valueText : null;
                  valueText = "";
                  if (password == "") {
                    setState(() {
                      password = null;
                      Navigator.of(context).pop();
                    });
                  } else {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  }
                },
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
    _nameController.dispose();
    _serverController.dispose();
    _passwordController.dispose();
  }
}
