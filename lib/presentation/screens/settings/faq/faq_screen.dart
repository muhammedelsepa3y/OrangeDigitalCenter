import 'dart:core';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../business_logic/faq/faq_cubit.dart';
import '../../../views/constancts/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  List<bool> isExpandedd =List.filled(10, false);
  @override
  Widget build(BuildContext context) {
    FaqCubit faqCubit = FaqCubit.get(context);
    faqCubit.faqRequest();
    

    return BlocBuilder<FaqCubit,FaqState>(builder:(context,state){
      return Scaffold(

        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
          ),
          title: Text('FAQ',style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.bold),),

          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListView.separated(
                  itemCount: faqCubit.myFaqlist.length,
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    );
                  },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.all(5.h),
                      child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
                          child: Padding(
                            padding:  EdgeInsets.all(3.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                    children: [
                                      Expanded(child: Text('${faqCubit.myFaqlist[index]['question'].toString().substring(4,faqCubit.myFaqlist[index]['question'].toString().length-5)}',style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),)),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
faqCubit.changeVisibility();
                                            isExpandedd[index] = !isExpandedd[index];
                                          });
                                        },
                                        icon: isExpandedd[index] ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down),
                                      ),
                                    ]
                                )

                                ,
                                SizedBox(height: 2.h,),

                                Visibility(
                                  visible: isExpandedd[index],
                                  child: Column(
                                    children: [
                                      Divider(color: Colors.grey[600],),
                                      Text('${faqCubit.myFaqlist[index]['answer'].toString().substring(4,faqCubit.myFaqlist[index]['answer'].toString().length-5)}',style: TextStyle(fontSize: 12.sp),),
                                    ],
                                  ),
                                )

                              ],
                            ),
                          )),
                    );},


                ),

              ],
            ),
          ),
        ),
      );
    });

  }
}
