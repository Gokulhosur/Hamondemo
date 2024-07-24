import 'package:flutter/material.dart';

class CommonDetailsPage extends StatefulWidget {
  final pagedetailstype;
  final pagedetails;
  const CommonDetailsPage(
      {Key? key, required this.pagedetailstype, required this.pagedetails})
      : super(key: key);

  @override
  _CommonDetailsPageState createState() => _CommonDetailsPageState();
}

class _CommonDetailsPageState extends State<CommonDetailsPage> {
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
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  widget.pagedetailstype == "student"
                      ? "Student Detail"
                      : "Subject Detail",
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(widget.pagedetailstype == "student"
                        ? "assets/studentprofile.png"
                        : "assets/subjectprofile.png"),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        widget.pagedetails.name,
                        style: const TextStyle(fontSize: 23),
                      ),
                    ),
                    Text(
                      widget.pagedetailstype == "student"
                          ? "Age : ${widget.pagedetails.age}"
                          : widget.pagedetails.teacher,
                      style: const TextStyle(fontSize: 23),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        widget.pagedetailstype == "student"
                            ? widget.pagedetails.email
                            : "Credit : ${widget.pagedetails.credits}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
