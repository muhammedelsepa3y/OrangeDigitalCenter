import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../data/data_provider/local/home_data.dart';
import '../../widgets/core/app_title.dart';
import '../../widgets/home/custom_home_item.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = 'homeScreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
          child: Column(
            children: [
              AppTitle(),
              SizedBox(
                height: 5.h,
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: homeItem.length,
                    itemBuilder: (_, index) =>
                        CustomHomeItem(homeModel: homeItem[index])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
