import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/add_data_controller.dart';

class AddDataView extends StatelessWidget {
  AddDataView({super.key});
  final controller = Get.put(AddDataController());

  @override
  Widget build(BuildContext context) {
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
                controller.addUser();
              },
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}