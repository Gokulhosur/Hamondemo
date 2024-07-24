import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamondemo/models/apicallspage.dart';
import 'package:hamondemo/view/common_details_page.dart';

import 'classroom/classroom_details.dart';

class CommonListPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final pagetype;
  const CommonListPage({Key? key, required this.pagetype}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CommonListPageState createState() => _CommonListPageState();
}

class _CommonListPageState extends State<CommonListPage> {
  Future? futuredata;
  @override
  void initState() {
    super.initState();
    futuredata = initfun();
  }

  initfun() async {
    print("called init");
    var tempvar = widget.pagetype == "student"
        ? await servercall.getstudentlist()
        : widget.pagetype == "classroom"
            ? await servercall.getclassroomlist()
            : await servercall.getsubjectlist();
    return tempvar;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //elevation: 0,
          // title: IconButton(
          //   onPressed: () {
          //     Get.back();
          //   },
          //   icon: Icon(Icons.arrow_back_ios_rounded),
          // ),
          iconTheme: const IconThemeData(color: Colors.black),
          // automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  widget.pagetype == "student"
                      ? "Students"
                      : widget.pagetype == "classroom"
                          ? "Class Rooms"
                          : "Subjects",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: futuredata,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                if (widget.pagetype == "classroom") {
                                  Get.to(() => ClassroomDetails(
                                        classroomid: snapshot.data[index].id,
                                      ));
                                } else {
                                  Get.to(() => CommonDetailsPage(
                                        pagedetailstype: widget.pagetype,
                                        pagedetails: snapshot.data[index],
                                      ));
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Card(
                                  color: const Color.fromRGBO(209, 209, 209, 1),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data[index].name,
                                              style:
                                                  const TextStyle(fontSize: 17),
                                            ),
                                            Text(
                                              widget.pagetype == "student"
                                                  ? snapshot.data[index].email
                                                  : widget.pagetype ==
                                                          "classroom"
                                                      ? snapshot
                                                          .data[index].layout
                                                      : snapshot
                                                          .data[index].teacher,
                                              style:
                                                  const TextStyle(fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          widget.pagetype == "student"
                                              ? "Age:${snapshot.data[index].age}"
                                              : widget.pagetype == "classroom"
                                                  ? "${snapshot.data[index].size}\nSeats"
                                                  : "${snapshot.data[index].credits}\nCredit",
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
