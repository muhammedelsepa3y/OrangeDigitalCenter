import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


import '../../data/Models/lectures_model.dart';

class LecturesCardItem extends StatelessWidget {
   LecturesCardItem({Key? key,required this.lecturesModel}) : super(key: key);

  LecturesModel lecturesModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13.h,
      child: Padding(
        padding:  EdgeInsets.all(2.w),
        child: Card(
          child: Padding(
            padding:  EdgeInsets.all(2.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lecturesModel.title),
                    Row(
                      children: [
                        const Icon(Icons.alarm),
                         Text(lecturesModel.duration),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text('Lecture Date'),
                        Row(
                          children: [
                            const Icon(Icons.alarm),
                             Text(lecturesModel.data),
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
                             Text(lecturesModel.startTime),
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
                            Text(lecturesModel.endTime),
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
