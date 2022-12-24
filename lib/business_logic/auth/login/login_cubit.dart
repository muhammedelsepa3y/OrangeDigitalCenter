import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workshop/constants/end_points.dart';
import 'package:workshop/data/Models/auth/login_model.dart';
import 'package:workshop/data/data_provider/remote/dio_helper.dart';

import '../../../constants/constant_methods.dart';
import '../../../presentation/views/app_layout.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
String token="";
  bool visiblePassword = false;

  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    emit(PasswordVisibilityState());
  }

  void postLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: loginEndPoint, data: {
      'email': email,
      'password': password,
    }).then((value) async{
      if (value.statusCode == 200) {
        flutterToast(msg: 'Login Successfully', color: Colors.green);
        await SharedPreferences.getInstance().then((valuee) {
          valuee.setString("TOKEN", value.data['data']['accessToken']);
        });
        token=value.data['data']['accessToken'];
        await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  AppLayout(),), (route) => false);
        emit(LoginSuccessState(loginModel: LoginModel.fromJson(value.data)));
      }
      if ((value.statusCode == 400 || value.statusCode == 401 || value.statusCode == 500 || value.statusCode == 404 || value.statusCode == 403 || value.statusCode == 405 )& kDebugMode) {
        flutterToast(msg: 'Login Failed', color: Colors.red);
      }
    }).catchError((error) {
      flutterToast(msg: 'Login Failed', color: Colors.red);
      if (kDebugMode) {
        print(error.toString());
      }
      emit(LoginErrorState());
    });
  }
}
