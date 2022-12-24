import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:workshop/presentation/views/news_card_item.dart';

import '../../../business_logic/news/news_cubit.dart';
import '../../views/constancts/app_color.dart';
import '../../widgets/core/default_text.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit,NewsState>(builder:(context,state){
      NewsCubit newCubit = NewsCubit.get(context);
      newCubit.newsRequest(context: context);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: Text('News',style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.bold),),

          centerTitle: true,
          elevation: 0,
        ),
        body:Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          /// TODO: Get data form API.
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) =>  dummydata[index],
          ),
        ),
      );
    });
  }
}
List dummydata=[
  NewsCardItem(
    title: "ODCs",
    date: "2022-07-06",
    description: "ODC Supports All Universties",
    imageLink: "https://www.memento.fr/photos/26885/vignette-26885.jpg",
    url: "https://www.orangedigitalcenters.com/",
  ),
];
