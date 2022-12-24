import 'package:flutter/material.dart';
import 'package:workshop/presentation/views/screen_tabs.dart';

import '../widgets/home/home_nav.dart';




class AppLayout extends StatefulWidget {
  static const String routeName = 'appLayout';

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
int i=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tabs[i],
        bottomNavigationBar: HomeNav(
          index: i,
          func: (index) {setState(() {
            i=index;
          });},
        ),
      ),
    );
  }
}
