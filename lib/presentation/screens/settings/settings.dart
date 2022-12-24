import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../views/constancts/app_color.dart';

import 'faq/faq_screen.dart';
import 'log_out/log_out.dart';
import 'our_partners/our_partners.dart';
import 'support/support.dart';
import 'terms_condition/terms_condition.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
                child: Text(
                  'Settings',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 5.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (c)=>settingList[index].pageName));
                      },
                      child: ListTile(
                        title: Text('${settingList[index].title}',style: TextStyle(fontSize: 12.sp),),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.w),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  );
                },
                itemCount: settingList.length,
              ),

            ],
          ),
        ),
      ),
    );
  }
}


class settingitem{
String title;
Widget pageName ;
settingitem({required this.title,required this.pageName});

}
List<settingitem> settingList = [
settingitem(title: 'FAQ',pageName: FAQ()),
settingitem(title: 'Terms & Conditions',pageName: Terms_Condition()),
settingitem(title: 'Our Partners',pageName: Our_Partners()),
settingitem(title: 'Support',pageName: Support()),
settingitem(title: 'Log out',pageName: Log_Out()),


];
