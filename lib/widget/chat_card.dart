import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telsip/models/chats_model.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({Key? key, required this.chat, required this.press,}) : super(key: key);

  final ChatsModel chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${chat.userId}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Text("${chat.chatsMsg!.last.userId}",),
                  Text("${chat.chatsMsg!.last.msg}", overflow: TextOverflow.ellipsis,),
                ],
              ),
            ),
            Text("${chat.chatsMsg!.last.time}"),
          ],
        ),
      ),
    );
  }
}
