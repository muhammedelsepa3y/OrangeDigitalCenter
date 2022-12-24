import 'package:flutter/material.dart';

import '../../../data/Models/section_model.dart';
import '../../views/constancts/app_color.dart';
import '../../views/sections_card_item.dart';
import '../../widgets/core/default_text.dart';




class SectionsScreen extends StatelessWidget {
  SectionsScreen({Key? key}) : super(key: key);
  List ScreenModelDummyDataList = <SectionModel>[
    SectionModel(
      title: 'FLUTTER',
      duration: '2 hrs',
      data: '2022-09',
      startTime: '02:00 pm',
      endTime: '04:00 pm',
    ),
    SectionModel(
      title: 'xamarin',
      duration: '2 hrs',
      data: '2022-09',
      startTime: '02:00 pm',
      endTime: '04:00 pm',
    ),
    SectionModel(
      title: 'ionic',
      duration: '2 hrs',
      data: '2022-09',
      startTime: '02:00 pm',
      endTime: '04:00 pm',
    ),
    SectionModel(
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
          title: Text("Sections"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: ScreenModelDummyDataList.length,
          itemBuilder: (context, index) =>
              SectionCardItem(screenModel: ScreenModelDummyDataList[index],),
        ));
  }
}
