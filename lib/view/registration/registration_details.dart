import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamondemo/view/registration/registration.dart';

import '../../controller/getcontroller.dart';
import '../../models/apicallspage.dart';

class RegistrationDetails extends StatefulWidget {
  final regdetails;
  const RegistrationDetails({Key? key, this.regdetails}) : super(key: key);

  @override
  _RegistrationDetailsState createState() => _RegistrationDetailsState();
}

class _RegistrationDetailsState extends State<RegistrationDetails> {
  final Controller controller = Get.find();
  Future? reqdata;
  @override
  void initState() {
    super.initState();
    reqdata = initfuntion();
  }

  initfuntion() async {
    var tempreqstudentdata =
        await servercall.getstudentlistbyID(widget.regdetails.student);
    var tempreqsubjectdata =
        await servercall.getsubjectlistwithID(widget.regdetails.subject);
    return [tempreqstudentdata, tempreqsubjectdata];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          forceMaterialTransparency: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                "Registration",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: FutureBuilder(
                  future: reqdata,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            Card(
                              color: const Color.fromRGBO(209, 209, 209, 1),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Student details",
                                            style: TextStyle(fontSize: 17)),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          child: Text(snapshot.data[0].name,
                                              style: const TextStyle(
                                                  fontSize: 13)),
                                        ),
                                        Text(snapshot.data[0].email,
                                            style: TextStyle(fontSize: 13)),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                          "Age : ${snapshot.data[0].age}",
                                          style: TextStyle(fontSize: 13)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              color: const Color.fromRGBO(209, 209, 209, 1),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Subject details",
                                            style: TextStyle(fontSize: 17)),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          child: Text(snapshot.data[1].name,
                                              style: const TextStyle(
                                                  fontSize: 13)),
                                        ),
                                        Text(snapshot.data[1].teacher,
                                            style: TextStyle(fontSize: 13)),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                          "Credit : ${snapshot.data[1].credits}",
                                          style: TextStyle(fontSize: 13)),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: InkWell(
                    onTap: () async {
                      var result = await servercall
                          .deleteregistratonlist(widget.regdetails.id);
                      if (result == "success") {
                        Get.off(() => const Registration());
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(249, 97, 79, 1)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                          "Delete Registration",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
