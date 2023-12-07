import 'dart:convert';

import 'package:get/get.dart';
import 'package:myapp_json/Models/home_model.dart';
import 'package:myapp_json/Services/home_service.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  HomeService _homeService = HomeService();

  List<HomePostModel> list = [];

  bool loading = false;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void postData(String name, String job) async {
    try {
      loading = true;
      update();
      http.Response response = await _homeService.postData(name, job);

      if (response.statusCode == 201) {
        print(response.body);
      }
      loading = false;
      update();
    } catch (exception) {
      print(exception);
    }
  }

  void updateData(String name, String job, int userId) async {
    try {
      loading = true;
      update();
      http.Response response = await _homeService.updateData(name, job, userId);

      if (response.statusCode == 200) {
        print(response.body);
      }
      loading = false;
      update();
    } catch (exception) {
      print(exception);
    }
  }

  void deleteData(int? userId) async {
    try {
      loading = true;
      update();
      http.Response response = await _homeService.deleteData(userId!);

      if (response.statusCode == 204) {
        print("Delete Successfully");
      }
      loading = false;
      update();
    } catch (exception) {
      print(exception);
    }
  }

  void getData() async {
    try {
      loading = true;
      update();
      http.Response result = await _homeService.getData();
      print(result.statusCode);
      if (result.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(result.body);
        if (jsonData.containsKey('data')) {
          List<Map<String, dynamic>> dataList =
              List<Map<String, dynamic>>.from(jsonData['data']);
          dataList.forEach((item) {
            list.add(HomePostModel.fromJson(item));
          });
          loading = false;
          update();
        }
      }
    } catch (exception) {
      print(exception);
    }
  }
}
