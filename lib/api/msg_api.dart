import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:telsip/models/chats_model.dart';

class MsgApi{
Future<List<ChatsModel>> fetchMsg() async {
  final String response = await rootBundle.loadString('assets/chats.json');
  final listData = await json.decode(response);
  List<ChatsModel> data = [];
  listData.forEach((item) {
    data.add(ChatsModel.fromJson(item));
  });
  return data;
}
}