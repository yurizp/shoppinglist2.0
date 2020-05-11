import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_20/exceptions/auth/disabled_user_firebase_execption.dart';
import 'package:shopping_list_20/exceptions/auth/inexistent_email_firebase_execption.dart';
import 'package:shopping_list_20/exceptions/auth/invalid_email_firebase_execption.dart';
import 'package:shopping_list_20/exceptions/auth/invalid_email_regex_execption.dart';
import 'package:shopping_list_20/exceptions/auth/invalid_password_firebase_execption.dart';
import 'package:shopping_list_20/model/Auth.dart';
import 'package:shopping_list_20/model/user.dart';

class LoginButton extends StatefulWidget {
  final GlobalKey<FormState> _formKey;
  final EdgeInsets edgeInsets;
  final User user;

  LoginButton(
    this._formKey,
    this.user, {
    this.edgeInsets,
  });

  @override
  State<StatefulWidget> createState() => new _LoginButton();
}

class _LoginButton
    extends State<LoginButton> {
  String _userId = "";

  @override
  void setState(VoidCallback fn) {
    setState(fn) {
      widget.user;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          widget.edgeInsets == null ? EdgeInsets.all(8.0) : widget.edgeInsets,
      child: RaisedButton(
        onPressed: () async {
          try {
            await Auth().signIn(widget.user.email, widget.user.password);
          } catch (e) {
            dialog(
              context,
              "Na verdade não sei o que ocorreu, mas por favor tente novamente mais tarde.",
            );
          }
        },
        child: Text('Entrar', style: TextStyle(fontSize: 18),),
      ),
    );
  }

  void dialog(BuildContext context, String content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Vish, palgo aconteceu."),
            content: new Text(
              content,
              textAlign: TextAlign.justify,
            ),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: new Text("Show, entendi."))
            ],
          );
        });
  }
}

class Dialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
