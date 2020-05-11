import 'package:flutter/material.dart';
import 'package:shopping_list_20/component/communs/app_name.dart';
import 'package:shopping_list_20/component/introducing/button_continue.dart';
import 'package:shopping_list_20/component/introducing/description.dart';
import 'package:shopping_list_20/component/introducing/logo_image.dart';

class Introducing extends StatelessWidget {
  Introducing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          LogoImage(),
          AppName(),
          Description(),
          ButtonContinue()
        ],
      ),
    );
  }
}
