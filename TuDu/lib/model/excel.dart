class Excel {
  late int? id;
  late String name;

  Excel(this.id, this.name);

  Map<String, dynamic> toMap(){
    final map = Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    return map;
  }

  Excel.fromMap(Map<String, dynamic> map){
    id = map['id'];
    name = map['name'];
  }
}