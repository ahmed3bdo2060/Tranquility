class TestModel{
  late int id;
  late final String name,des;
  late final num price;

  TestModel({required this.name, required this.des, required this.price});

  TestModel.fromJson(Map<String,dynamic> json){
    id = json["id"]??0;
    name = json["name"]??"";
    des = json["des"]??"";
    price = json["price"]??0;
  }
  Map<String,dynamic> toJson(){
    return {
      "name":name,
      "des":des,
      "price":price,
    };
}
}