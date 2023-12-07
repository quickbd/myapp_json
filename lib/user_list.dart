import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_json/Controllers/home_controller.dart';

import 'package:myapp_json/Models/home_model.dart';

import 'add_user.dart';

class UserList extends StatefulWidget {
    UserList({Key? key}) : super(key: key);




  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  HomeController homeController = Get.put(HomeController());


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
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
                    title:  Text("${data.firstName.toString()}  ${data.lastName.toString()}"),
                    subtitle:  Text(data.email.toString()),
                    trailing: Container(
                      width: 100.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                             // _updateDialogue(context, index);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddUser())) ;
                            },
                            child: Icon(Icons.edit),
                          ),
                          InkWell(
                            onTap: (){
                              //  _deleteDialogue(context, index);
                              homeController.deleteData(data.id?.toInt());
                            },
                            child: Icon(Icons.delete, color: Colors.deepOrange,),
                          ),
                        ],
                      ),

                    ),
                  ),
                );
              }
          );
        },),
      ),
    );
  }
}
