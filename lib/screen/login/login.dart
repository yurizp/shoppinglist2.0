import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_20/component/communs/app_name.dart';
import 'package:shopping_list_20/component/login/login_form.dart';
import 'package:shopping_list_20/component/register/form.dart';

class Login extends StatelessWidget {
  TextEditingController _controllerInputName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          AppName(edgeInsets: EdgeInsets.fromLTRB(0, 130, 0, 20)),
          LoginForm()
        ],
      ),
    );
  }
}
