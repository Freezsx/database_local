import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../Models/user_model.dart';
import '../View/homepage_view.dart';

class EditDataController extends GetxController {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  Database? database;
  var data = [].obs;

  void EditUser() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_user";
    database = await openDatabase(path);
    List<dynamic> userData = data.value;
    UserModel user = UserModel(
      id: userData[0],
      nama: namaController.text,
      email: emailController.text,
    );
    await database!.update("user", user.toJson(), where: "id = ?", whereArgs: [user.id]);
    Get.offAll(HomePageView());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    List<dynamic> userData = data.value;
    namaController.text = userData[1];
    emailController.text = userData[2];
    super.onReady();
  }
}