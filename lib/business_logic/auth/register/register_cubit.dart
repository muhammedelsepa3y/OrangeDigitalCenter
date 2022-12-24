import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop/constants/constant_methods.dart';
import 'package:workshop/constants/end_points.dart';
import 'package:workshop/data/data_provider/remote/dio_helper.dart';


import '../../../presentation/screens/login/login_screen.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool visiblePassword = false;
  bool visibleConfirmPassword = false;

  /// function to change password visibility
  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    emit(VisiblePasswordState());
  }

  /// function to change password visibility
  void changeConfirmPasswordVisibility() {
    visibleConfirmPassword = !visibleConfirmPassword;
    emit(VisibleConfirmPasswordState());
  }

  String gender = 'm';
  void changeGender(value){
    gender = value;
    emit(ChangeGenderState());
  }

  Future postRegister(
      {required String name,
      required String email,
      required String password,
      required String phoneNumber,
      required String gender,
      required BuildContext context}) async {
    emit(RegisterLoadingState());
    DioHelper.postData(url: registerEndPoint, data: {
      "name": name,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "gender": gender,
    }).then((value) async{
      if (value.statusCode == 200) {
        flutterToast(msg: 'Registered Successfully', color: Colors.green);
        await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  LoginScreen(),), (route) => false);
        emit(RegisterSuccessState());
      }
      if ((value.statusCode == 400 || value.statusCode == 401 || value.statusCode == 500 || value.statusCode == 404 || value.statusCode == 403 || value.statusCode == 405 )& kDebugMode) {
        flutterToast(msg: 'Register Failed', color: Colors.red);
      }

    }).catchError((error) {
      flutterToast(msg: 'Register Failed', color: Colors.red);
      if (kDebugMode) {
        print(error.toString());
      }
      emit(RegisterErrorState());
    });
  }
}
