// import 'package:sqflite/sqflite.dart' as sql;

// import 'package:flutter/foundation.dart';

// class SQLHelper {
//   static Future<void> createTables(sql.Database database) async {
//     await database.execute('''
//     CREATE TABLE items(
//       id INTIGER PRIMARY KEY AUTOINCREMENT NOT NULL,
//       title TEXT,
//       description TEXT,
//       created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
//     )
//     ''');
//   }

//   static Future<sql.Database> db() async {
//     return sql.openDatabase('dbhostsaf.db', version: 1,
//         onCreate: (sql.Database database, int version) async {
//       await createTables(database);
//     });
//   }

//   static Future<int> createItem(String title, String? description) async {
//     final db = await SQLHelper.db();

//     final data = {
//       'title': title,
//       'description': description,
//     };

//     final id = await db.insert('insert', data,
//         conflictAlgorithm: sql.ConflictAlgorithm.replace);
//     return id;
//   }

//   static Future<List<Map<String, dynamic>>> getItems() async {
//     final db = await SQLHelper.db();
//     return db.query('items', orderBy: 'id');
//   }

//   static Future<List<Map<String, dynamic>>> getItem(int id) async {
//     final db = await SQLHelper.db();
//     return db.query('items', where: "id=?", whereArgs: [id], limit: 1);
//   }

//   static Future<int> updateItem(
//       int id, String title, String? description) async {
//     final db = await SQLHelper.db();
//     final data = {
//       'title': title,
//       'description': description,
//       'createdAt': DateTime.now().toString()
//     };

//     final result =
//         await db.update('items', data, where: "id=?", whereArgs: [id]);
//     return result;
//   }

//   // delete mei error aa rha hai

//   static Future<void> deleteItem(int id) async {
//     final db = SQLHelper.db();
//     // try {
//     //   await db.delete("items", where: "id=?", whereArgs: [id]);
//     // } catch (err) {
//     //   debugPrint("Something went wrong when deleting an item : $err");
//     // }
//     // return await db!.delete("items", where: '$id=?', whereArgs: [id]);
//   }
// }
