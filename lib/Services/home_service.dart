
import 'dart:convert';

import 'package:http/http.dart' as http;

class HomeService {
  Future<http.Response> getData() async {
    String url = "https://reqres.in/api/users";

    http.Response response = await http.get(Uri.parse(url));

    return response;
  }


  Future<http.Response> postData(String name, String job) async {
    String url = "https://reqres.in/api/users";

    Map data={"name": name, "job": job};


    http.Response response = await http.post(Uri.parse(url), body: json.encode(data) );

    return response;
  }


  Future<http.Response> updateData(String name, String job, int userId) async {
    String url = "https://reqres.in/api/users/${userId.toString()}";

    Map data={"name": name, "job": job};


    http.Response response = await http.put(Uri.parse(url), body: json.encode(data) );

    return response;
  }

  Future<http.Response> deleteData(int userId) async {
    String url = "https://reqres.in/api/users/${userId.toString()}";



    http.Response response = await http.delete(Uri.parse(url) );

    return response;
  }
}
