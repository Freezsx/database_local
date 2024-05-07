import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/homepage_controller.dart';
import '../Models/user_model.dart';
import 'add_data_view.dart';
import 'edit_data_view.dart';

class HomePageView extends StatelessWidget {
  HomePageView({super.key});
  final controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter CRUD"),
          centerTitle: true,
        ),
        body: FutureBuilder<List<UserModel>>(
          future: controller.getDataUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  UserModel user = snapshot.data![index];
                  return ListTile(
                    title: Text(user.nama!),
                    subtitle: Text(user.email!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(EditDataView(),
                                arguments: [user.id, user.nama, user.email]);
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.delete(user.id!);
                            Get.offAll(HomePageView());
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(child: Text("Tidak Ada Data"));
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddDataView());
          },
          child: Icon(Icons.add),
        ));
  }
}