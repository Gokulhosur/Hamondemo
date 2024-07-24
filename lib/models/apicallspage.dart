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

  getstudentlistbyID(int id) async {
    var templist;
    try {
      var response = await connect
          .get("${controller.url}/students/$id${controller.apikey}");
      print(response.body);

      if (response.statusCode == 200) {
        templist = GetStudentList.fromJson(response.body);
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

  getsubjectlistwithID(int id) async {
    var templist;
    print(id);
    try {
      var response = await connect
          .get("${controller.url}subjects/$id${controller.apikey}");
      print(response.body);

      if (response.statusCode == 200) {
        templist = GetsubjectList.fromJson(response.body);
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

  postsubjecttocalssroom(int classroomid, int subjectid) async {
    print(classroomid);
    print(
        "${controller.url}classrooms/$classroomid${controller.apikey}&subject=$subjectid");

    try {
      var response = await connect.patch(
        "${controller.url}classrooms/$classroomid${controller.apikey}",
        {"subject": subjectid},
        contentType: 'application/x-www-form-urlencoded',
      );
      print(response.body);

      if (response.statusCode == 200) {
        return "success";
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  getsregistratonlist() async {
    var templist = [];
    try {
      var response = await connect
          .get("${controller.url}registration${controller.apikey}");
      print(response.body);

      if (response.statusCode == 200) {
        templist = response.body["registrations"]
            .map((json) => GetRegistrationList.fromJson(json))
            .toList();
      }
      return templist;
    } on Exception catch (e) {
      print(e);
    }
  }

  postnewregistration() async {
    print(
        "${controller.url}registration/${controller.apikey}   ${controller.registrationstudentmap[0]["studentid"]},       ${controller.registrationsubjectmap[0]["subjectid"]},");
    try {
      var response = await connect.post(
        "${controller.url}registration/${controller.apikey}",
        {
          "student": controller.registrationstudentmap[0]["studentid"],
          "subject": controller.registrationsubjectmap[0]["subjectid"],
        },
        contentType: 'application/x-www-form-urlencoded',
      );
      print(response.body);

      if (response.statusCode == 200) {
        return "success";
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  deleteregistratonlist(int id) async {
    try {
      var response = await connect
          .delete("${controller.url}registration/$id${controller.apikey}");
      print(response.body);

      if (response.statusCode == 200) {
        return "success";
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
