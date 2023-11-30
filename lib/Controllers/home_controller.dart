

import 'dart:convert';

import 'package:get/get.dart';
import 'package:myapp_json/Models/home_model.dart';
import 'package:myapp_json/Services/home_service.dart';
import 'package:http/http.dart' as http;
class HomeController extends GetxController{

  HomeService _homeService = HomeService();

  List<HomePostModel> list=[];

   bool loading=false;

@override
  void onInit() {
  getData();
  super.onInit();
  }


  void getData() async{
    try{
      bool loading=true;
      update();
     http.Response result = await _homeService.getData();
     if(result.statusCode == 200){
        List<dynamic> datalist = jsonDecode(result.body);
        datalist.forEach((item) {
          list.add(HomePostModel.fromJson(item));
        });
        bool loading=false;
        update();


     }

    }catch(exception){
       print(exception);
    }
  }

}