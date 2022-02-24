import 'package:flutter/material.dart';
import 'package:telsip/api/msg_api.dart';
import 'package:telsip/models/chats_model.dart';
import 'package:telsip/ui/messages_screen.dart';
import 'package:telsip/widget/chat_card.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  late Future<List<ChatsModel>> chatMsgObject;
  @override
  void initState() {
    super.initState();
     chatMsgObject = MsgApi().fetchMsg();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChatsModel>>(
      future: chatMsgObject,
        builder: (context, snapshot){
          if(snapshot.hasData){
            var data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
                itemBuilder: (context, index){
                return ChatCard(chat: data[index], press: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MessagesScreen(chatsModel: data[index],))));
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

