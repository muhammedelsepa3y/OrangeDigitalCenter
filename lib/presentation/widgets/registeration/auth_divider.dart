import 'package:flutter/material.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:const [
        Expanded(child: Divider()),
        Text('OR'),
        Expanded(child: Divider())
      ],
    );
  }
}
