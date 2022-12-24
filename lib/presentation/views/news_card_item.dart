import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/core/default_text.dart';
class NewsCardItem extends StatefulWidget {
 String imageLink;
   String title;
   String description;
  String url;
  String date;
  NewsCardItem({required this.title,required this.url,required this.imageLink,required this.description,required this.date});

  @override
  State<NewsCardItem> createState() => _NewsCardItemState(
      title: title,
      url: url,
      imageLink: imageLink,
      description: description,
      date: date);

}

class _NewsCardItemState extends State<NewsCardItem> {
  String imageLink;
  String title;
  String description;
  String url;
  String date;
  _NewsCardItemState({required this.title,required this.url,required this.imageLink,required this.description,required this.date});



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(3.sp),
            child: CircleAvatar(

              radius: 30.sp,
              backgroundImage:  NetworkImage(

                imageLink,
           scale: 1


              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                 DefaultText(text: title,fontSize: 10.sp),
                  Padding(
                    padding:  EdgeInsets.only(top:8.sp),
                    child: DefaultText(text: date,fontSize: 8.sp),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 1.5.h),
                  child: DefaultText(


                    fontSize: 8.sp,
                    text:
                    description
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
