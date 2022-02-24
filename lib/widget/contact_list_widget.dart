import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:telsip/linphonekotlininterface.dart';



class FlutterContactsWidget extends StatefulWidget {
  const FlutterContactsWidget({Key? key}) : super(key: key);

  @override
  _FlutterContactsExampleState createState() => _FlutterContactsExampleState();
}

class _FlutterContactsExampleState extends State<FlutterContactsWidget> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts(withProperties: true);
      setState(() => _contacts = contacts);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_permissionDenied) return const Center(child: Text('Permission denied'));
    if (_contacts == null) return const Center(child: CircularProgressIndicator());
    var contacts =
    _contacts!.where((element) => element.phones.isNotEmpty).toList();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.42,
      child: ListView.separated(
          separatorBuilder: (_, __) => const Divider(height: 0),
          itemCount: contacts.length,
          itemBuilder: (context, i) => ListTile(
              leading: Image.asset(
                  "assets/images/ic_contact_picture_180_holo_light.png"),
              title: Text(contacts[i].displayName, style: Theme.of(context).textTheme.bodyText1,),
              subtitle: Text(contacts[i].phones.first.number, style: Theme.of(context).textTheme.bodyText1,),
              onTap: ()  {linphoneKotlinInterface.instance.make_call({"remoteaddress":contacts[i].phones.first.number});})),
    );
  }
}
