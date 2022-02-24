import 'package:flutter/material.dart';
import 'package:telsip/models/chats_model.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key, required this.chatsModel}) : super(key: key);
  final ChatsModel chatsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${chatsModel.userId}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:  Colors.black),),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: ListView.builder(
                  itemCount: chatsModel.chatsMsg!.length,
                  itemBuilder: (context, index) {
                    var data = chatsModel.chatsMsg![index];
                    if(chatsModel.chatsMsg!.isEmpty) {
                      return Text('В этом диалоге нет сообщений');
                    } else {
                      return Column(
                        crossAxisAlignment: data.userId == 7214 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: Text(
                              data.msg,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                            constraints:
                            BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.75),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: data.userId == 7214 ? Color(0xFF2757FF) : Color(0xFFE7EEFF),
                            ),
                          )
                        ],
                      );
                    }
              }),
            ),),
        ],
      ),
    );
  }
}
