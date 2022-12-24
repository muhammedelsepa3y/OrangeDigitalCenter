import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workshop/business_logic/auth/login/login_cubit.dart';
import 'package:workshop/constants/end_points.dart';
import 'package:workshop/data/Models/auth/login_model.dart';
import 'package:workshop/data/data_provider/remote/dio_helper.dart';

import '../../../constants/constant_methods.dart';
import '../../../presentation/views/app_layout.dart';
import '../../data/Models/news_model.dart';
import '../../presentation/screens/settings/faq/faq_screen.dart';


part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  List<dynamic> mynewlist=[];
  NewsModel? newsModel;

   newsRequest({required BuildContext context})  {
    print("object");
    emit(NewsLoadingState());

      DioHelper.getData(

        url: newsEndPoint,
        token:  LoginCubit().token,
      ).then((value)  {
        print("jelijr");
        emit(NewsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsErrorState());
      });

  }





  }


