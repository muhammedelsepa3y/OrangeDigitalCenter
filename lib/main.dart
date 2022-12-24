import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:workshop/business_logic/auth/login/login_cubit.dart';
import 'package:workshop/business_logic/auth/register/register_cubit.dart';
import 'package:workshop/business_logic/notes/notes_cubit.dart';
import 'package:workshop/data/data_provider/local/cache_helper.dart';
import 'package:workshop/data/data_provider/remote/dio_helper.dart';
import 'package:workshop/presentation/screens/settings/faq/faq_screen.dart';
import 'package:workshop/presentation/screens/splash_screen/splash_screen.dart';


import 'business_logic/faq/faq_cubit.dart';
import 'business_logic/news/news_cubit.dart';
import 'constants/app_colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Hive.initFlutter();
  //Hive.registerAdapter(NoteAdapter());
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return CalendarControllerProvider(
          controller: EventController(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => NewsCubit(),
              ),
              BlocProvider(
                create: (context) => FaqCubit(),
              ),
              BlocProvider(
                create: (context) => NotesCubit(),
              ),
              BlocProvider(
                create: (context) => RegisterCubit(),
              ),
              BlocProvider(
                create: (context) => LoginCubit(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Sizer',
              theme: ThemeData(
                  elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  AppColors.primaryColor,
                ),
              ))),
              home:  SplashScreen(),
            ),
          ),
        );
      },
    );
  }
}
