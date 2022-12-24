import 'package:flutter/material.dart';

class HomeModel {
  String title;
  String image;
  Widget PageName;
  Function? func;

  HomeModel({required this.image, required this.title, this.func,required  this.PageName});
}
