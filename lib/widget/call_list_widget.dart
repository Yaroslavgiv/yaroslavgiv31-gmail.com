import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:telsip/linphonekotlininterface.dart';

class CallListWidget extends StatefulWidget {
  const CallListWidget({Key? key}) : super(key: key);

  @override
  _CallListWidgetState createState() => _CallListWidgetState();
}


class _CallListWidgetState extends State<CallListWidget> {

  Future<Iterable<CallLogEntry>>? logs;

  Future<Iterable<CallLogEntry>> getCallLog() async {
    Iterable<CallLogEntry> callLog = await CallLog.get();
    return callLog;
  }

  getCallType(CallType callType){
    switch(callType){
      case CallType.incoming:
        return Image.asset('assets/images/ic_call_incoming_holo_dark.png');
      case CallType.outgoing:
        return Image.asset('assets/images/ic_call_outgoing_holo_dark.png');
      case CallType.missed:
        return Image.asset('assets/images/ic_call_missed_holo_dark.png');
    }
  }

  String formatDate(DateTime dt){
    return DateFormat('H:m:s d-MMM-y').format(dt);
  }



  @override
  void initState() {
    super.initState();
    logs = getCallLog();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: logs,
        builder: (context, snapshot) {
        if(snapshot.hasData){
          if(snapshot.connectionState == ConnectionState.done){
            Iterable<CallLogEntry>? entries = snapshot.data as Iterable<CallLogEntry>?;
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.separated(
                  separatorBuilder: (_, __) => const Divider(height: 0),
                  itemCount: entries!.length,
                  itemBuilder: (context, i) {
                    if(entries.elementAt(i).number!.length > 2 && entries.elementAt(i).number!.length < 5) {
                      return ListTile(
                        leading: Image.asset(
                            "assets/images/ic_contact_picture_180_holo_light.png"),
                        title: Text(entries.elementAt(i).number!, style: Theme.of(context).textTheme.bodyText1,),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5,),
                            Text('${entries.elementAt(i).number!}@192.168.12.100', style: Theme.of(context).textTheme.bodyText1,),
                            SizedBox(height: 5,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getCallType(entries.elementAt(i).callType!),
                                SizedBox(width: 5,),
                                Text(formatDate(DateTime.fromMillisecondsSinceEpoch(entries.elementAt(i).timestamp!)), style: Theme.of(context).textTheme.bodyText1,),
                              ],
                            ),
                          ],
                        ),
                        trailing:
                        IconButton(
                          icon: Icon(Icons.call,color: Theme.of(context).iconTheme.color),
                          onPressed: () {linphoneKotlinInterface.instance.make_call(
                              {"remoteaddress" : entries.elementAt(i).number!});},
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  }
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        } else {
          return SizedBox();
        }

    });
  }
}
//
// class Calls{
//   String id;
//   String sip;
//
//   Calls({required this.id,required this.sip});
// }