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
import '../../presentation/screens/settings/faq/faq_screen.dart';


part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitialState());

  static FaqCubit get(context) => BlocProvider.of(context);
  List<dynamic> myFaqlist=[];
  bool visible = false;
  void changeVisibility() {
    visible = !visible;
    emit(changeVisibilityState());
  }

   void  faqRequest() {
    emit(FaqLoadingState());
    DioHelper.getData(url: faqEndPoint, token: LoginCubit().token,
    ).then((value) async{
      if (value.statusCode == 200) {
        myFaqlist=value.data['data'];
emit(FaqSuccessState());

      }



      if ((value.statusCode == 400 || value.statusCode == 401 || value.statusCode == 500 || value.statusCode == 404 || value.statusCode == 403 || value.statusCode == 405 )& kDebugMode) {
        flutterToast(msg: 'Downloaded Failed', color: Colors.red);
      }
    }).catchError((error) {
      flutterToast(msg: 'Downloaded Failed', color: Colors.red);
      if (kDebugMode) {
        print(error.toString());
      }
      emit(FaqErrorState());
    });
  }


}
