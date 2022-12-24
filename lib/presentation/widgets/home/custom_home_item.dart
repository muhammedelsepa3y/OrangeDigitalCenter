import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../data/Models/home_model.dart';
import '../../views/constancts/app_color.dart';
import '../core/default_text.dart';
class CustomHomeItem extends StatefulWidget {
  HomeModel homeModel;

  CustomHomeItem({required this.homeModel});

  @override
  State<CustomHomeItem> createState() => _CustomHomeItemState();
}

class _CustomHomeItemState extends State<CustomHomeItem> {
  double iconSize = 10.w;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        await Navigator.push(context, MaterialPageRoute(builder: (_) {
          return widget.homeModel.PageName;
        })).then((value) => setState(() {}));
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
        child: Padding(
          padding: EdgeInsets.all(3.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                widget.homeModel.image,
width: iconSize,
height: iconSize,
                matchTextDirection: true,
              ),



              DefaultText(
                text: widget.homeModel.title,
                fontSize: 11.sp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
