import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_20/component/login/login_button.dart';
import 'package:shopping_list_20/component/register/input_string.dart';
import 'package:shopping_list_20/model/user.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginForm();
  }

  LoginForm({Key key}) : super(key: key);
}

class _LoginForm extends State<LoginForm> {
  final TextEditingController _textEditingControllerPassword =
      new TextEditingController();
  final TextEditingController _textEditingControllerEmail =
      new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  User _user = null;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    _user = new User(
      _textEditingControllerPassword.text,
      null,
      _textEditingControllerEmail.text,
      null,
      null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
          child: Column(children: <Widget>[
            InputString(
              "E-mail",
              maxLenght: 100,
              controller: this._textEditingControllerEmail,
              onChanged: (context) => {
                setState(() {
                  _user = null;
                }),
              },
            ),
            InputString(
              "Senha",
              controller: this._textEditingControllerPassword,
              maxLenght: 12,
              obscureText: true,
              onChanged: (context) => {
                setState(() {
                  _user = null;
                }),
              },
            ),
            LoginButton(
              _formKey,
              this._user,
            ),
            RaisedButton(
              child: Text("Me cadastrar", style: TextStyle(fontSize: 16),),
            )
          ]),
        ));
  }
}
