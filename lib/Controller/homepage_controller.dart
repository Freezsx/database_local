import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../Models/user_model.dart';

class HomePageController extends GetxController {
  Database? database;
  void initDatabase() async {
    String db_name = "db_user";
    int db_version = 1;
    String table = "user";
    String id = "id";
    String nama = "nama";
    String email = "email";
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + db_name;

    if (database == null) {
      database = await openDatabase(path, version: db_version,
          onCreate: (db, version) {
            print(path);
            db.execute('''
        CREATE TABLE IF NOT EXISTS $table (
              $id INTEGER PRIMARY KEY AUTOINCREMENT,
              $nama VARCHAR(255),
              $email VARCHAR(255)
            )''');
          });
    }
  }

  Future<List<UserModel>> getDataUser() async {
    String table = "user";
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_user";
    database = await openDatabase(path);
    final data = await database!.query(table);
    List<UserModel> user = data.map((e) => UserModel.fromJson(e)).toList();
    return user;
  }

  Future<void> delete(int id) async {
    String table = "user";
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_user";
    database = await openDatabase(path);
    await database!.delete(table, where: "id = ?", whereArgs: [id]);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    initDatabase();
    super.onInit();
  }
}