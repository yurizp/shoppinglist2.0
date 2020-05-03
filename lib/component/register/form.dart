import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gender_selector/gender_selector.dart';
import 'package:shopping_list_20/component/register/date_input.dart';
import 'package:shopping_list_20/component/register/gender_selector.dart';
import 'package:shopping_list_20/component/register/input_string.dart';
import 'package:shopping_list_20/component/register/send_button.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegisterForm();
  }
}

class _RegisterForm extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  Gender _selectedGender;

  @override
  void setState(VoidCallback fn) {
    setState(fn){
      _selectedGender;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          InputString("Nome completo", hint: "Marianx Silva"),
          DateInput(),
          SendButton("Continuar", _formKey),
          GenderSelectorForm(_selectedGender)

        ]));
  }
}
