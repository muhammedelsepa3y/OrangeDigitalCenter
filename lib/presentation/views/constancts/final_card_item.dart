import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../data/Models/finals_model.dart';



class FinalCardItem extends StatelessWidget {
  FinalCardItem({Key? key,required this.screenModel}) : super(key: key);

  FinalModel screenModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14.5.h,
      child: Padding(
        padding:  EdgeInsets.all(2.w),
        child: Card(
          child: Padding(
            padding:  EdgeInsets.all(4.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(screenModel.title),
                    Row(
                      children: [
                        const Icon(Icons.alarm),
                        Text(screenModel.duration),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text('Section Date'),
                        Row(
                          children: [
                            const Icon(Icons.alarm),
                            Text(screenModel.data),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Text('Start Time'),
                        Row(
                          children: [
                            const Icon(Icons.alarm,color: Colors.greenAccent,),
                            Text(screenModel.startTime),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Text('End Time'),
                        Row(
                          children: [
                            const Icon(Icons.alarm,color: Colors.redAccent,),
                            Text(screenModel.endTime),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
