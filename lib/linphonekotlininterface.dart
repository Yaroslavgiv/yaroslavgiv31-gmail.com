import 'dart:async';

import 'package:flutter/services.dart';

class linphoneEvent{
  Map <String, String> args;
  linphoneEvent(this.args);
}

class linphoneKotlinInterface {
  static final linphoneKotlinInterface _instance =
      linphoneKotlinInterface._init();
  final String _CHANNEL = "tel.sip/service";
  static late MethodChannel _platform_connector;
  static late StreamController _controller;

  static linphoneKotlinInterface get instance => _instance;

  Stream<linphoneEvent> get stream => _controller.stream as Stream <linphoneEvent>;

  linphoneKotlinInterface._init() {
    _platform_connector = MethodChannel(_CHANNEL);
    _controller = new StreamController<linphoneEvent>.broadcast();

    _platform_connector.setMethodCallHandler((call) {
      Map<String, String> args = Map.from(call.arguments);
      args["CMD_NAME"] = call.method;
      _controller.add(linphoneEvent(args));
      return Future.delayed(Duration(milliseconds: 100), () => 1);
    });
  }

  Future<void> _executeCmd(String command, Map<String, String> args) async {
    try {
      final String reponce =
          await _platform_connector.invokeMethod(command, args);
    } on Exception catch (e) {
      print(e);
    }
  }

  //Сервисные и конфигурационные функции
  Future<void> launch_core(Map<String, String> args) async =>
      _executeCmd("launch_core", args);

  Future<void> do_setup(Map<String, String> args) async =>
      _executeCmd("do_setup", args);

  Future<void> do_login(Map<String, String> args) async =>
      _executeCmd("do_login", args);

  Future<void> start_service(Map<String, String> args) async =>
      _executeCmd("start_service", args);

  Future<void> stop_service(Map<String, String> args) async =>
      _executeCmd("stop_service", args);

  Future<void> restart_service(Map<String, String> args) async =>
      _executeCmd("restart_service", args);

  //Команды
  Future<void> answer_incoming_call(Map<String, String> args) async =>
      _executeCmd("answer_incoming_call", args);

  Future<void> hangup_call(Map<String, String> args) async =>
      _executeCmd("hangup_call", args);

  Future<void> make_call(Map<String, String> args) async =>
      _executeCmd("make_call", args);

  //Микрокоманды и другие действия

  Future<void> start_recording(Map<String, String> args) async =>
      _executeCmd("start_recording", args);

  Future<void> stop_recording(Map<String, String> args) async =>
      _executeCmd("stop_recording", args);

  Future<void> toggle_speakerphone(Map<String, String> args) async =>
      _executeCmd("toggle_speakerphone", args);

  Future<void> mute_mic(Map<String, String> args) async =>
      _executeCmd("mute_mic", args);
}
