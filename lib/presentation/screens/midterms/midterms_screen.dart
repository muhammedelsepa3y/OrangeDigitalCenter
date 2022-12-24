

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


import '../../views/constancts/app_color.dart';
import '../../widgets/home/custom_midterm.dart';
class Midterms extends StatefulWidget {

  @override
  State<Midterms> createState() => _MidtermsState();
}

class _MidtermsState extends State<Midterms> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: Text("Midterms"),
        ),
        body:ListView.builder(itemBuilder: (context,index)=>Midterm(
          title: midterms[index].title,
          date: midterms[index].date,
          start_time: midterms[index].start_time,
          end_time: midterms[index].end_time,
          duration: midterms[index].duration,
        ),itemCount: midterms.length,)
    );
  }
}

