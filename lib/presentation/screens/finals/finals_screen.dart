import 'package:flutter/material.dart';

import '../../../data/Models/finals_model.dart';
import '../../../data/Models/section_model.dart';


import '../../views/constancts/app_color.dart';
import '../../views/constancts/final_card_item.dart';
import '../../views/sections_card_item.dart';
import '../../widgets/core/default_text.dart';




class FinalScreen extends StatelessWidget {
  FinalScreen({Key? key}) : super(key: key);
  List ScreenModelDummyDataList = <FinalModel>[
    FinalModel(
      title: 'FLUTTER',
      duration: '2 hrs',
      data: '2022-09',
      startTime: '02:00 pm',
      endTime: '04:00 pm',
    ),
    FinalModel(
      title: 'xamarin',
      duration: '2 hrs',
      data: '2022-09',
      startTime: '02:00 pm',
      endTime: '04:00 pm',
    ),
    FinalModel(
      title: 'ionic',
      duration: '2 hrs',
      data: '2022-09',
      startTime: '02:00 pm',
      endTime: '04:00 pm',
    ),
    FinalModel(
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
          title: Text("Finals"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: ScreenModelDummyDataList.length,
          itemBuilder: (context, index) =>
              FinalCardItem(screenModel: ScreenModelDummyDataList[index],),
        ));
  }
}
