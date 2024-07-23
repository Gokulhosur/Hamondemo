import 'package:flutter/material.dart';

class ClassroomDetails extends StatefulWidget {
  const ClassroomDetails({Key? key}) : super(key: key);

  @override
  _ClassroomDetailsState createState() => _ClassroomDetailsState();
}

class _ClassroomDetailsState extends State<ClassroomDetails> {
  int left = 0, rigth = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  initfunction(int length) {
    setState(() {
      left = (length / 2).ceil();
      rigth = length - left;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                initfunction(int.parse(value));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    for (int i = 0; i < left; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(i.toString()),
                      )
                  ],
                ),
                Container(
                  height:
                      (MediaQuery.sizeOf(context).height - 200) * ((left) / 20),
                  width: MediaQuery.sizeOf(context).width - 200,
                  color: Colors.black54,
                ),
                Column(
                  children: [
                    for (int j = 0; j < rigth; j++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(j.toString()),
                      )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
