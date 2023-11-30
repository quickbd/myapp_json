import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_json/Controllers/home_controller.dart';

import 'package:myapp_json/Models/home_model.dart';

class HomePage extends StatefulWidget {
    HomePage({Key? key}) : super(key: key);




  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<HomeController>(builder: (_){
          return homeController.loading? CircularProgressIndicator() : ListView.builder(
            shrinkWrap: true,
              itemCount: homeController.list.length,
              itemBuilder: (context,index){
                HomePostModel data= homeController.list[index];
                return Card(
                  child: ListTile(leading: Text(data.id.toString()),
                    title:  Text(data.title.toString()),
                    subtitle:  Text(data.body.toString()),
                  ),
                );
              }
          );
        },),
      ),
    );
  }
}
