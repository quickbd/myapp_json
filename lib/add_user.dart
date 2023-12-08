import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_json/Controllers/home_controller.dart';

import 'package:myapp_json/Models/home_model.dart';
import 'package:myapp_json/user_list.dart';

class AddUser extends StatelessWidget {
  final HomePostModel? user; // Change parameter name to user
  final TextEditingController nameCrt = TextEditingController();
  final TextEditingController jobCrt = TextEditingController();

  AddUser({Key? key, this.user}) : super(key: key);

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      nameCrt.text = user!.firstName ?? '';
      jobCrt.text = user!.lastName ?? '';
    }

    final _key = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Add User'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: 300,
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    Text('Add/Edit User'),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Name"),
                      controller: nameCrt,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Job"),
                      controller: jobCrt,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Job";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      child: Text(user != null ? 'Update' : 'Submit'),
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          _key.currentState!.save();
                          print(nameCrt.toString());

                          if (user != null) {
                            homeController.updateData(nameCrt.toString(),
                                jobCrt.toString(), user!.id?? 0);
                          } else {
                            homeController.postData(
                                nameCrt.toString(), jobCrt.toString());
                          }

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserList()));
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    /*         ElevatedButton(
                    child: Text('Update'),
                    onPressed: (){
                      homeController.updateData("Suzana", "Developer", 3);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  ElevatedButton(
                    child: Text('Delete'),
                    onPressed: (){
                      homeController.deleteData(3);
                    },
                  ),*/
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
