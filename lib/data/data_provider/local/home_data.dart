import 'package:flutter/material.dart';

import '../../../presentation/screens/events/events.dart';
import '../../../presentation/screens/finals/finals_screen.dart';
import '../../../presentation/screens/lectures/lectures_screen.dart';
import '../../../presentation/screens/midterms/midterms_screen.dart';
import '../../../presentation/screens/notes/notes_screen.dart';
import '../../../presentation/screens/sections/sections_screen.dart';
import '../../Models/home_model.dart';
import '../../../constants/app_assets.dart';

List<HomeModel> homeItem = [
  HomeModel(image: AppAssets.lecturesIconSVG, title: 'Lectures', func: () {},PageName: LecturesScreen()),
  HomeModel(image: AppAssets.sectionsIconSVG, title: 'Section', func: () {},PageName: SectionsScreen()),
  HomeModel(image: AppAssets.midtermIconSVG, title: 'Midterms', func: () {},PageName: Midterms()),
  HomeModel(image: AppAssets.finalIconSVG, title: 'Finals', func: () {},PageName:FinalScreen()),
  HomeModel(image: AppAssets.eventIconSVG, title: 'Events', func: () {},PageName: MyHomePage()),
  HomeModel(image: AppAssets.notesIconSVG, title: 'Notes', func: () {},PageName: NotesScreen()),
];
