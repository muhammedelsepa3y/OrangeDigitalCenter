import 'package:flutter/material.dart';


import '../../../data/Models/lectures_model.dart';
import '../../views/constancts/app_color.dart';
import '../../views/lectures_card_item.dart';

class LecturesScreen extends StatelessWidget {
  LecturesScreen({Key? key}) : super(key: key);
  List lectureModelDummyDataList = <LecturesModel>[
    LecturesModel(
      title: 'FLUTTER',
      duration: '2 hrs',
      data: '2022-09',
      startTime: '02:00 pm',
      endTime: '04:00 pm',
    ),
    LecturesModel(
      title: 'xamarin',
      duration: '2 hrs',
      data: '2022-09',
      startTime: '02:00 pm',
      endTime: '04:00 pm',
    ),
    LecturesModel(
      title: 'ionic',
      duration: '2 hrs',
      data: '2022-09',
      startTime: '02:00 pm',
      endTime: '04:00 pm',
    ),
    LecturesModel(
      title: 'react',
      duration: '2 hrs',
      data: '2022-09',
      startTime: '02:00 pm',
      endTime: '04:00 pm',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: Text("Lectures"),
          centerTitle: true,
        ),
        body: ListView.builder(
      itemCount: lectureModelDummyDataList.length,
      itemBuilder: (context, index) =>
          LecturesCardItem(lecturesModel: lectureModelDummyDataList[index]),
    ));
  }
}
