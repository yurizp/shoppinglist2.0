import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_20/component/communs/app_name.dart';
import 'package:shopping_list_20/component/register/form.dart';

class Register extends StatelessWidget {
  TextEditingController _controllerInputName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          AppName(size: 36, edgeInsets: EdgeInsets.fromLTRB(0, 50, 0, 0)),
          RegisterForm()
        ],
      ),
    );
  }
}
