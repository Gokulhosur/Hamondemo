import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamondemo/models/apimodels.dart';

import '../controller/getcontroller.dart';

var servercall = Server();

class Server {
  final Controller controller = Get.find();
  final connect = GetConnect();

  getstudentlist() async {
    var templist = [];
    try {
      var response =
          await connect.get("${controller.url}/students${controller.apikey}");
      print(response.body);

      if (response.statusCode == 200) {
        templist = response.body["students"]
            .map((json) => GetStudentList.fromJson(json))
            .toList();
      }
      return templist;
    } on Exception catch (e) {
      print(e);
    }
  }

  getsubjectlist() async {
    var templist = [];
    try {
      var response =
          await connect.get("${controller.url}subjects${controller.apikey}");
      print(response.body);

      if (response.statusCode == 200) {
        templist = response.body["subjects"]
            .map((json) => GetsubjectList.fromJson(json))
            .toList();
      }
      return templist;
    } on Exception catch (e) {
      print(e);
    }
  }

  getclassroomlist() async {
    var templist = [];
    try {
      var response =
          await connect.get("${controller.url}classrooms${controller.apikey}");
      print(response.body);

      if (response.statusCode == 200) {
        templist = response.body["classrooms"]
            .map((json) => GetClassroomList.fromJson(json))
            .toList();
      }
      return templist;
    } on Exception catch (e) {
      print(e);
    }
  }

  getclassroomlistwithID(int id) async {
    print(id);
    print("${controller.url}classrooms/$id${controller.apikey}");
    var templist;
    try {
      var response = await connect
          .get("${controller.url}classrooms/$id${controller.apikey}");
      print(response.body);

      if (response.statusCode == 200) {
        templist = GetClassroomList.fromJson(response.body);
      }
      return templist;
    } on Exception catch (e) {
      print(e);
    }
  }
}
