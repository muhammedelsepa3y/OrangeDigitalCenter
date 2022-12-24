import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:workshop/business_logic/auth/login/login_cubit.dart';
import 'package:workshop/constants/constant_methods.dart';

import 'package:workshop/presentation/screens/register/register_screen.dart';
import 'package:workshop/presentation/widgets/registeration/default_text_form_field.dart';

import '../../../constants/app_colors.dart';

import '../../views/app_layout.dart';
import '../../widgets/core/default_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          flutterToast(msg: 'Logged in Successfully', color: Colors.green);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) =>  AppLayout(),
              ),
                  (route) => false);
        }
      },
      builder: (context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Form(
              key: loginKey,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Orange',
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Digital Center',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  DefaultTextFormField(
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Email';
                      } else if (!RegExp(
                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                          .hasMatch(value)) {
                        return 'Please Enter Valid as example@gmail.com';
                      }
                    },
                    onChanged: () {},
                    hintText: 'Email',
                    isObscureText: false,
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  DefaultTextFormField(
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Password';
                      }
                    },
                    onChanged: () {},
                    isPasswordField: true,
                    hintText: 'Password',
                    controller: passwordController,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (loginKey.currentState!.validate()) {
                        loginCubit.postLogin(
                          email: emailController.text,
                          password: passwordController.text,
                          context: context,
                        );



                      }

                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        AppColors.primaryColor,
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Divider(
                          color: Colors.grey,
                        )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.w),
                          child:  DefaultText(
                              text: 'OR', textColor: Colors.grey),
                        ),
                        const Expanded(
                            child: Divider(
                          color: Colors.grey,
                        )),
                      ],
                    ),
                  ),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ));
                      },
                      style: OutlinedButton.styleFrom(
                        primary: AppColors.primaryColor,
                        side: const BorderSide(color: AppColors.primaryColor),
                      ),
                      child: const Text('Register')),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
