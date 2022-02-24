import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tudu/db/database.dart';
import 'package:tudu/model/qrcode.dart';

import 'model/excel.dart';

void main() async => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Моё приложение',
      home: StudentPage(),
    );
  }
}

class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>(); //* глобальный ключ для
  final _studentNameController = TextEditingController();
  // final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // Barcode? result;
  // QRViewController? controller;

  late Future<List<Excel>> _excelList;
  late String _excelName;
  // ignore: non_constant_identifier_names
  List<String> Imports = []; //* массив заполнения юзеров
  final _focusNode = FocusNode();


  bool isUpdate = false;
  late int? excelIdForUpdate;

  @override
  void initState() {
    super.initState();
    updateExcelList();
  }

  updateExcelList() {
    setState(() {
      _excelList = DBProvider.db.getExcels();
    });
  }

  void createCSV() async {
    String path = (await getExternalStorageDirectory())!.path +
        '/csv-${DateTime.now()}.csv';
    final File file = File(path);
    // ignore: avoid_print
    print(path);
    final SnackBar exportSnackBar = SnackBar(content: Text(path)); //* отображение на экране расположения выгруженного файла
    await file.writeAsString(Imports.join('\n'));
    ScaffoldMessenger.of(context).showSnackBar(exportSnackBar);
  }


  final SnackBar snackBar = const SnackBar(content: Text('База данных не пуста!'));


  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Моя записная книжка'),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formStateKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Please Enter Student Name';
                      }
                      if (value.trim() == "") {
                        return "Поле не должно быть пустым!!!";
                      }
                      return null;
                    },

                    onSaved: (value) {
                      _excelName = value!;
                    },
                    controller: _studentNameController,
                    focusNode: _focusNode,

                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 2,
                            style: BorderStyle.solid),
                      ),
                      labelText: "Введите Имя",
                      icon: Icon(
                        Icons.people,
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  textStyle: const TextStyle(color: Colors.black),
                ),
                // color: Colors.green,
                child: Text(
                  (isUpdate ? 'Обновить' : 'Записать'),
                  style: const TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (isUpdate) {
                    if (_formStateKey.currentState!.validate()) {
                      _formStateKey.currentState!.save();
                      DBProvider.db
                          .updateExcel(Excel(excelIdForUpdate, _excelName))
                          .then((value) => (data) {
                                setState(() {
                                  isUpdate = false;
                                });
                              });
                    }
                  } else {
                    if (_formStateKey.currentState!.validate()) {
                      _formStateKey.currentState!.save();
                      DBProvider.db.insertExcel(Excel(null, _excelName));
                    }
                  }
                  _studentNameController.text = '';
                  updateExcelList();
                  FocusScope.of(context).unfocus(); // * прятать клаву после ввода
                },
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  textStyle: const TextStyle(color: Colors.white),
                ),
                child: Text(
                  (isUpdate ? 'Очистить' : 'Удалить'),
                ),
                onPressed: () {
                  _studentNameController.text = '';
                  setState(() {
                    isUpdate = false;
                    excelIdForUpdate = null;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    textStyle: const TextStyle(color: Colors.white),
                  ),
                  child: const Text(
                    ('Очистить базу'),
                  ),
                  onPressed: () {
                    DBProvider.db.deleteAllExcel();
                    updateExcelList();
                  }),
            ],
          ),
          const Divider(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(color: Colors.white),
                ),
                child: const Text('Экспорт в Excel'),
                onPressed: () {
                  createCSV();
                },
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(color: Colors.white),
                ),
                child: const Text('Импорт из Excel'),
                onPressed: () async {
                  if(Imports.isEmpty){
                    final result = await FilePicker.platform.pickFiles();
                    if (result == null) return;
                    final file = result.files.first;
                    final input = File(file.path!).openRead();
                    final data = await input.transform(utf8.decoder)
                        .transform(const LineSplitter())
                        .toList();
                    for(var i in data){
                      DBProvider.db.insertExcel(Excel(null, i));
                    }

                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  updateExcelList();
                },
              ),
            ],
          ),
          const Divider(
            height: 5.0,
          ),
          Expanded(
            child: FutureBuilder(
              future: _excelList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Imports.clear();
                  var tempName = snapshot.data as List<Excel>;
                  for (var i in tempName) {
                    Imports.add(i.name);
                  }

                  return generateList(snapshot.data as List<Excel>, width);
                }

                if (snapshot.data == null) {
                  return const Text('No data Fond');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],

      ),
      floatingActionButton: FloatingActionButton(
      elevation: 0.0,
      child: const Icon(Icons.qr_code_2),
      backgroundColor: const Color(0xFF158B29),
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const QRScanner()));
      },
    ),

    );
  }

  SingleChildScrollView generateList(List<Excel> excels, double width) { //* создание массива для отображения содержимого базы данных
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: width,
        child: DataTable(
          columnSpacing: 80,
          horizontalMargin: 15,
          columns: [
            DataColumn(
              label: SizedBox(
                child: const Text('NAME'),
                width: width * .6,
              ),
            ),
            // DataColumn(
            //
            //   label: Text('DELETE'),
            // ),
            DataColumn(
                label: SizedBox(
              child: const Text(
                'DELETE',
              ),
              width: width * .3,
            )),
          ],
          rows: excels
              .map(
                (excel) => DataRow(cells: [
                  DataCell(Text(excel.name), onTap: () {
                    setState(() {
                      isUpdate = true;
                      excelIdForUpdate = excel.id;
                    });
                    _studentNameController.text = excel.name;
                  }),
                  DataCell(
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        DBProvider.db.deleteExcel(excel.id!);
                        updateExcelList();
                      },
                    ),
                  ),
                ]),
              )
              .toList(),
        ),
      ),
    );
  }
}


