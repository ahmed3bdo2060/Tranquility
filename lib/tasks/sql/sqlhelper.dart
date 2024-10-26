import 'package:path/path.dart';
import 'package:projects/tasks/sql/model.dart';
import 'package:sqflite/sqflite.dart';

class SqlHelper{
static late Database db;
static late String path;
static Future<void> open()async{
  final dbPath = await getDatabasesPath();
   path = join(dbPath, 'ahmed.db');
   // db = await openDatabase('ahmed.db');
    db = await openDatabase(path,version: 1,onCreate: (db, version)async {
     await db.execute(
         'CREATE TABLE Products (id INTEGER PRIMARY KEY, name TEXT,des TEXT, price DOUBLE)');
   },);
}
static Future<void> insertProduct(TestModel model)async{
 db.insert("Products", model.toJson());
}
static Future<void> deleteProduct(int id)async{
  await db
      .rawDelete('DELETE FROM Products WHERE id = ?', [id]);
}
static Future<List<TestModel>>getProduct()async{
  List<Map> list = await db.rawQuery('SELECT * FROM Products');
  final result = List.from(list).map((e) => TestModel.fromJson(e),).toList();
  return result;
}
static Future<void> deleteDB()async{
  await deleteDatabase(path);
}
static Future<void> close()async{
   db.close();
}

  static Future<void> updateProduct(int id, TestModel model)async {
  db.update("Products", model.toJson(),whereArgs:["$id"] ,where:"id = ?" );
  }

}