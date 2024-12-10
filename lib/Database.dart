import 'package:final_project/Database.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';





class DatabaseHelper{
 static  int _version =1;
 static String _dbName = 'Gymdb';

 static Future<Database> _getdb()async{
   return openDatabase(join( await getDatabasesPath(),_dbName),
     version: _version,
     onCreate: (db, version)async {
       await db.execute('CREATE TABLE gym ( t_name TEXT,time INTEGER ,date TEXT ,price INTEGER )');
     },
   );
}




}





class Add_Time{
  String? name;
  int? time;
  String? date;
  int? price;
  Add_Time({required this.name,required this.time,required this.date,required this.price});
  factory Add_Time.fromjson(Map<String,dynamic>json)=> Add_Time(
      name: json['name'],
      time: json['time'],
      date: json['date'],
      price: json['price']
  );

  Map<String,dynamic> tojson()=>{
    'name':name,
    'time':time,
    'date':date,
    'price':price,
  };
}