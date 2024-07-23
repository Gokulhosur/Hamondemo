import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamondemo/utils.dart';
import 'package:hamondemo/view/classroom/classroom_details.dart';
import 'package:hamondemo/view/registration/registration_details.dart';
import 'package:hamondemo/view/student/student_page.dart';
import 'package:hamondemo/view/subject/subject_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool uitoogle = true;
  List uilist = [
    {
      "lable": "Students",
      "image": "assets/student.png",
      "color": const Color.fromRGBO(170, 201, 191, 1)
    },
    {
      "lable": "Subjetcs",
      "image": "assets/subject.png",
      "color": const Color.fromRGBO(216, 235, 253, 1)
    },
    {
      "lable": "Class Rooms",
      "image": "assets/classroom.png",
      "color": const Color.fromRGBO(255, 224, 221, 1)
    },
    {
      "lable": "Registration",
      "image": "assets/registration.png",
      "color": const Color.fromRGBO(255, 243, 217, 1)
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Good Morning",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          elevation: WidgetStatePropertyAll(0),
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.transparent)),
                      onPressed: () {
                        setState(() {
                          uitoogle = !uitoogle;
                        });
                      },
                      child: SizedBox(
                        height: 50,
                        child: uitoogle
                            ? Image.asset("assets/grid.png")
                            : Image.asset("assets/menu.png"),
                      ))
                ],
              ),
              Expanded(
                child: Center(
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: uitoogle ? 2 : 1,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 15,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (uitoogle
                                  ? (MediaQuery.of(context).size.height / 1.8)
                                  : (MediaQuery.of(context).size.height / 15))),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  Get.to(() => const StudentPage());
                                  break;
                                case 1:
                                  Get.to(() => const SubjectPage());
                                  break;
                                case 2:
                                  Get.to(() => const ClassroomDetails());
                                  break;
                                case 3:
                                  Get.to(() => const RegistrationDetails());
                                  break;
                                default:
                              }
                            },
                            child: customBoxTemplate(uilist[index], uitoogle));
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
