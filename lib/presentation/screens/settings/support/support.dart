import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../views/constancts/app_color.dart';
import '../../../widgets/core/default_text.dart';
import '../../../widgets/registeration/default_text_form_field.dart';

class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

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
          title: Text('Support',style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.bold),),

          centerTitle: true,
          elevation: 0,
        ),

        body: Form(

          child: SingleChildScrollView(
            child: Column(
              children: [

                //Title
                SizedBox(height: 5.h),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: DefaultTextFormField(
                      controller: TextEditingController(),

                      maxLines:1,
                      labelText: 'Name',
                      hintText: 'Enter Name',
                      validation: (val)
                      {
                        if (val.isEmpty)
                        {
                          return 'Please Enter Your Name';
                        }


                      }, onChanged: (){},
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: DefaultTextFormField(
                      controller: TextEditingController(),

                      maxLines:1,
                      labelText: 'Email',
                      hintText: 'Enter Email',
                      validation: (val)
                      {
                        if (val.isEmpty)
                        {
                          return 'Please Enter Your Email';
                        }


                      }, onChanged: (){},
                      ),
                ),

                //Description
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: DefaultTextFormField(
                    controller: TextEditingController(),
                    maxLines: 10,
                    labelText: "whats\"s making you unhappy",
                    hintText: "whats\"s making you unhappy",
                    validation: (val) {
                      if (val.isEmpty)
                      {
                        return "whats\"s making you unhappy";
                      }

                    }, onChanged: (){},

                    ),
                ),

                //Button Edit
                Container(
                  width: 120,
                  margin: const EdgeInsets.only(top: 15.0),
                  child: ElevatedButton(

                      child:DefaultText(text:  "Submit"),
                      onPressed: () {
Navigator.pop(context);

                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
