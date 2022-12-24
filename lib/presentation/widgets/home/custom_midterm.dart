import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Midterm extends StatelessWidget {
  String title;
  String date;
  String start_time;
  String end_time;
  String duration;
Midterm({required this.title,required this.date,required this.start_time,required this.end_time,required this.duration});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17.h,
      child: Padding(
        padding:  EdgeInsets.all(1.w),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
          child: InkWell(
            onTap: () {

            },
            child: Padding(
              padding:  EdgeInsets.all(2.5.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("$title",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),),
                      Expanded(child: SizedBox()),
                      Icon(Icons.access_alarms_sharp,color: Colors.black,),
                      Text("$duration",style: TextStyle(color:Colors.black),)
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Exam Date",style: TextStyle(fontSize: 9.sp,fontWeight: FontWeight.bold,color: Colors.grey),),
                          Row(
                            children: [
                              Icon(Icons.calendar_month),
                              Text("$date",style: TextStyle(fontSize: 9.sp,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Start Time",style: TextStyle(fontSize: 9.sp,fontWeight: FontWeight.bold,color: Colors.grey),),
                          Row(
                            children: [
                              Icon(Icons.access_time_filled_outlined,color: Colors.green,),
                              Text("$start_time",style: TextStyle(fontSize: 9.sp,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("End Time",style: TextStyle(fontSize: 9.sp,fontWeight: FontWeight.bold,color: Colors.grey),),
                          Row(
                            children: [
                              Icon(Icons.access_time_filled_outlined,color: Colors.red,),
                              Text("$end_time",style: TextStyle(fontSize: 9.sp,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
List<Midterm>midterms=[
  Midterm(title: "Flutter", date: "2022-08-18", start_time: "12:00pm", end_time: "2:00pm", duration: "2hrs"),
  Midterm(title: "React", date: "2022-08-20", start_time: "12:00pm", end_time: "2:00pm", duration: "2hrs"),
  Midterm(title: "Vue", date: "2022-08-20", start_time: "2:00pm", end_time: "4:00pm", duration: "2hrs"),
  Midterm(title: "Flutter", date: "2022-06-05", start_time: "12:00pm", end_time: "2:00pm", duration: "2hrs"),
  Midterm(title: "React", date: "2022-06-07", start_time: "12:00pm", end_time: "2:00pm", duration: "2hrs"),
];
