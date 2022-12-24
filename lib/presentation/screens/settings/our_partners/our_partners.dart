import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


import '../../../views/constancts/app_color.dart';

class Our_Partners extends StatefulWidget {
  const Our_Partners({Key? key}) : super(key: key);

  @override
  State<Our_Partners> createState() => _Our_PartnersState();
}

class _Our_PartnersState extends State<Our_Partners> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),
        title: Text('Our Partners',style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.bold),),

        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all( 1.h),
          child: Container(

              height: 20.h,

              width: double.infinity,
              child:Card(


                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
                  child:Image.network("https://media-exp1.licdn.com/dms/image/C4E0BAQG2RX0NCCe26A/company-logo_200_200/0/1637923169202?e=1673481600&v=beta&t=5ilfXo2f4BZiuIenQ7s6UZbRJmj8SlOsfDkJJZNRrhs")




                )
          ),
        ),
      ),
    );

  }
}
