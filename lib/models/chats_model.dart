class ChatsModel {

  late int userId;
  late List<ChatMsgsModel>? chatsMsg;

  ChatsModel(
      {
      required this.userId,
      required this.chatsMsg});

  ChatsModel.fromJson(Map<String, dynamic> json) {
    userId = json["user_id"];
    if(json["messages"] != null){
      chatsMsg = <ChatMsgsModel>[];
      json["messages"].forEach((v){
        chatsMsg?.add(ChatMsgsModel.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    if (chatsMsg != null) {
      data['messages'] = chatsMsg!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class ChatMsgsModel{
  late int id;
  late int userId;
  late String msg;
  late String time;

  ChatMsgsModel({
    required this.id,
    required this.userId,
    required this.msg,
    required this.time});

  ChatMsgsModel.fromJson(Map<String, dynamic> json){
    id = json["id"];
    userId = json["user_id"];
    msg = json["msg"];
    time = json["ts"];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["user_id"] = userId;
    data["msg"] = msg;
    data["ts"] = time;
    return data;
  }
}