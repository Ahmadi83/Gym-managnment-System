
import 'dart:async';

import 'package:final_project/Classes.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';





class DatabaseHelper{
 static  int _version =1;
 static String _dbName = 'Gymdb';

 static Future<Database> _getdb()async{
   return openDatabase(join( await getDatabasesPath(),_dbName),
     version: _version,
     onCreate: (db, version)async {
       await db.execute('CREATE TABLE Free_Time (id INTEGER PRIMARY KEY AUTOINCREMENT, t_name TEXT,time INTEGER ,date TEXT ,price INTEGER )');
       await db.execute('CREATE TABLE contruct_Time(id INTEGER PRIMARY KEY AUTOINCREMENT, t_name TEXT, time TEXT , date TEXT , ex_date TEXT )');
       await db.execute('CREATE TABLE LOGIN( id INTEGER PRIMARY KEY AUTOINCREMENT, user_name TEXT, password TEXT)');
     },
   );
}
//---------For Insert free_Times------

Future<int> Insert_free(Free_Time free_time)async{
   final db = await _getdb();
   return await db.insert("Free_Time", free_time.tojson(),
   conflictAlgorithm: ConflictAlgorithm.replace,
   );
}

//----------------For Login_Page--------

 Future<bool> checkLogin(String username, String password) async {
   final db = await _getdb();
   final result = await db.query('LOGIN',
     where: 'user_name = ? AND password = ?',
     whereArgs: [username, password],
   );
   return result.isNotEmpty;
 }



  Future<int> Insert_Login(Login login) async {
    if (login.user_name == null || login.password == null) {
      throw Exception("Invalid input: user_name and password cannot be null");
    }
    final db = await _getdb();
    return await db.insert('LOGIN', login.tojson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


 //  static Future checkTable() async {
 //   final db = await _getdb();
 //   final tables = await db.rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
 //   return print(tables);
 // }


}
