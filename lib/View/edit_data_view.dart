import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/edit_data_controller.dart';

class EditDataView extends StatelessWidget {
  EditDataView({super.key});
  final controller = Get.put(EditDataController());
  @override
  Widget build(BuildContext context) {
    controller.data.value = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: controller.namaController,
              decoration: InputDecoration(
                labelText: "Nama",
                hintText: "Masukkan Nama",
              ),
            ),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Masukkan Email",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.EditUser();
              },
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}