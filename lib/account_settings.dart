import 'package:flutter/material.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {

  final _nameController = TextEditingController();
  final _userController = TextEditingController();
  final _serverController = TextEditingController();
  final _passwordController = TextEditingController();

  String? name;
  String? user;
  String? server;
  String? password;
  bool hidePassword = true;

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
                    contentPadding: EdgeInsets.only(left: 10),
                    title: name != null ? Text('Название аккаунта') : Text('Название аккаунта', style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),),
                    subtitle: name != null ? Text(name!) : Text('Отображаемое название аккаунта', style: TextStyle(color: Colors.orange),),
                    onTap: () {
                      if(name != null){
                        _nameController.text = name!;
                        nameAccountDialog(context);
                      } else {
                        nameAccountDialog(context);
                      }
                    },
                  ),
                  Divider(height: 1,
                    thickness: 1,
                    color: Colors.white10,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 10),
                    title: user != null ? Text('Пользователь') : Text('Пользователь', style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),),
                    subtitle: user != null ? Text(user!) : Text('Имя пользователя / логин (без @sip.server)', style: TextStyle(color: Colors.orange),),
                    onTap: () {
                      if(user != null){
                        _userController.text = user!;
                        userDialog(context);
                      } else {
                        userDialog(context);
                      }
                    },
                  ),
                  Divider(height: 1,
                    thickness: 1,
                    color: Colors.white10,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 10),
                    title: server != null ? Text('Сервер') : Text('Сервер', style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),),
                    subtitle: server != null ? Text(server!) : Text('SIP сервер домен/IP[:порт]', style: TextStyle(color: Colors.orange),),
                    onTap: () {
                      if(server != null){
                        _serverController.text = server!;
                        serverDialog(context);
                      } else {
                        serverDialog(context);
                      }
                    },
                  ),
                  Divider(height: 1,
                    thickness: 1,
                    color: Colors.white10,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 10),
                    title: password != null ? Text('Пароль') : Text('Пароль', style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),),
                    subtitle: password != null ? Text('*' * password!.length) : Text('Пароль доступа к аккаунту', style: TextStyle(color: Colors.orange),),
                    onTap: () {
                      if(password != null){
                        _passwordController.text = password!;
                        passwordDialog(context);
                      } else {
                        passwordDialog(context);
                      }
                    },
                  ),
                  Divider(height: 1,
                    thickness: 1,
                    color: Colors.white10,
                  ),
                ],
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                    child: Text('Отмена', style: TextStyle(color: Colors.white),),
                    onPressed: () async {
                      Navigator.of(context).maybePop();
                    },
                  ),
                  TextButton(
                    child: user != null && name != null && server != null && password != null ?
                    Text('Сохранить', style: TextStyle(color: Colors.white),) : Text('Сохранить', style: TextStyle(color: Colors.white24),),
                    onPressed:user != null && name != null && server != null && password != null ? () async {
                      Navigator.of(context).maybePop(user);
                    } : null,
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
            title: const Text('Название аккаунта'),
            content: (Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Отображаемое название аккаунта'),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _nameController,
                onChanged: (value) => name = value,
                ),
              ],
            )),
            actions: [
              TextButton(
                child: const Text('ОТМЕНА',style: TextStyle(color: Colors.cyan),),
                onPressed: () {
                  setState(()  => Navigator.of(context).pop()
                  );
                },
              ),
              TextButton(
                child: const Text('ОК',style: TextStyle(color: Colors.cyan),),
                onPressed: () {
                  if(name == "") {
                    setState(() {
                      name = null;
                      Navigator.of(context).pop();
                    });
                  } else {
                    setState(() {
                      _nameController.clear();
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
            title: const Text('Пользователь'),
            content: (Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Имя пользователя / логин (без @sip.server)'),
                SizedBox(height: 20,),
                TextFormField(controller: _userController,
                    onChanged: (value) => user = value,
                    ),
              ],
            )),
            actions: [
              TextButton(
                child: const Text('ОТМЕНА',style: TextStyle(color: Colors.cyan),),
                onPressed: () {
                  setState(() => Navigator.of(context).pop()
                  );
                },
              ),
              TextButton(
                child: const Text('ОК',style: TextStyle(color: Colors.cyan),),
                onPressed: () {
                  if(user == "") {
                    setState(() {
                      user = null;
                      Navigator.of(context).pop();
                    });
                  } else {
                    setState(() {
                      _userController.clear();
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
            title: const Text('Сервер'),
            content: (Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('SIP сервер домен/IP[:порт]'),
                SizedBox(height: 20,),
                TextFormField(controller: _serverController,
                    onChanged: (value) => server = value,
                ),
              ],
            )),
            actions: [
              TextButton(
                child: const Text('ОТМЕНА',style: TextStyle(color: Colors.cyan),),
                onPressed: () {
                  setState(() => Navigator.of(context).pop());
                },
              ),
              TextButton(
                child: const Text('ОК',style: TextStyle(color: Colors.cyan),),
                onPressed: () {
                  if(server == "") {
                    setState(() {
                      server = null;
                      Navigator.of(context).pop();
                    });
                  } else {
                    setState(() {
                      _serverController.clear();
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
            title: const Text('Пароль'),
            content: (Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Пароль доступа к аккаунту'),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _passwordController,
                  onChanged: (value) => password = value,
                  obscureText: hidePassword,
                ),

              ],
            )),
            actions: [
              TextButton(
                child: const Text('ОТМЕНА',style: TextStyle(color: Colors.cyan),),
                onPressed: () {
                  setState(() => Navigator.of(context).pop());
                },
              ),
              TextButton(
                child: const Text('ОК',style: TextStyle(color: Colors.cyan),),
                onPressed: () {
                  if(password == "") {
                    setState(() {
                      password = null;
                      Navigator.of(context).pop();
                    });
                  } else {
                    setState(() {
                      _passwordController.clear();
                      Navigator.of(context).pop();
                    });
                  }
                },
              ),
            ],
          );
        });
  }

}



