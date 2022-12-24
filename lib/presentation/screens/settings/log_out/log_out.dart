import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../login/login_screen.dart';



class Log_Out extends StatefulWidget {
  const Log_Out({Key? key}) : super(key: key);

  @override
  State<Log_Out> createState() => _Log_OutState();
}

class _Log_OutState extends State<Log_Out> {

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Logout"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text("Are you sure you want to logout?"),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text("Yes"),
          onPressed: () async {
            SharedPreferences preferences = await SharedPreferences.getInstance();
            await preferences.clear();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false);

          },
        ),
        TextButton(
          child: Text("No"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

      ],
    );
  }
}

