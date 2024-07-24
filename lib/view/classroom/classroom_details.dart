import 'package:flutter/material.dart';
import 'package:hamondemo/models/apicallspage.dart';

class ClassroomDetails extends StatefulWidget {
  final classroomid;
  const ClassroomDetails({Key? key, required this.classroomid})
      : super(key: key);

  @override
  _ClassroomDetailsState createState() => _ClassroomDetailsState();
}

class _ClassroomDetailsState extends State<ClassroomDetails> {
  int left = 0, right = 0;
  Future? classroomdata;
  @override
  void initState() {
    super.initState();
    classroomdata = initfunction();
  }

  initfunction() async {
    var tempdata = await servercall.getclassroomlistwithID(widget.classroomid);
    if (tempdata.layout == "conference") {
      setState(() {
        left = (tempdata.size / 2).ceil();
        right = tempdata.size - left;
      });
    }
    print("$left $right");
    return tempdata;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          forceMaterialTransparency: true,
        ),
        body: FutureBuilder(
          future: classroomdata,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(snapshot.data.name,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700)),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(209, 209, 209, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              snapshot.data.subject == ""
                                  ? const Text("Add Subject",
                                      style: TextStyle(fontSize: 17))
                                  : const Column(
                                      children: [],
                                    ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          170, 201, 191, 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 30),
                                    child: Text(snapshot.data.subject == ""
                                        ? "Add"
                                        : "Change"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                    Expanded(
                      child: SingleChildScrollView(
                        child: snapshot.data.layout == "conference"
                            ? Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        for (int i = 0; i < left; i++)
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                                "assets/chair left.png"),
                                          )
                                      ],
                                    ),
                                    Container(
                                      height:
                                          (MediaQuery.sizeOf(context).height -
                                                  200) *
                                              ((left) / 15),
                                      width: MediaQuery.sizeOf(context).width -
                                          200,
                                      color: const Color.fromRGBO(
                                          217, 217, 217, 1),
                                    ),
                                    Column(
                                      children: [
                                        for (int j = 0; j < right; j++)
                                          Padding(
                                            padding: const EdgeInsets.all(7.2),
                                            child: Image.asset(
                                                "assets/chair right.png"),
                                          )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(20),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          mainAxisSpacing: 30,
                                          crossAxisSpacing: 15,
                                          childAspectRatio:
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  ((MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      1.8))),
                                  itemCount: snapshot.data.size,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      decoration:
                                          BoxDecoration(border: Border.all()),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                            "assets/chair left.png"),
                                      ),
                                    );
                                  },
                                ),
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
    );
  }
}
