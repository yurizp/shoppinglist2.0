import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_20/exceptions/auth/disabled_user_firebase_execption.dart';
import 'package:shopping_list_20/exceptions/auth/inexistent_email_firebase_execption.dart';
import 'package:shopping_list_20/exceptions/auth/invalid_email_firebase_execption.dart';
import 'package:shopping_list_20/exceptions/auth/invalid_email_regex_execption.dart';
import 'package:shopping_list_20/exceptions/auth/invalid_password_firebase_execption.dart';
import 'package:shopping_list_20/model/Auth.dart';
import 'package:shopping_list_20/model/user.dart';

class RegisterUserInFirebaseButton extends StatefulWidget {
  final GlobalKey<FormState> _formKey;
  final String title;
  final EdgeInsets edgeInsets;
  final User user;

  RegisterUserInFirebaseButton(
    this.title,
    this._formKey,
    this.user, {
    this.edgeInsets,
  });

  @override
  State<StatefulWidget> createState() => new _RegisterUserInFirebaseButton();
}

class _RegisterUserInFirebaseButton
    extends State<RegisterUserInFirebaseButton> {
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
            await Auth().register(widget.user.email, widget.user.password,
                widget.user.confirmPassword);
          } on InvalidEmailRegexException {
            dialog(
              context,
              "Parece que seu e-mail é inválido, de uma olhadinha se não tem nada errado e tente novamente por favor.",
            );
          } on InvalidEmailFirebaseException {
            dialog(
              context,
              "Parece que seu e-mail é inválido, de uma olhadinha se não tem nada errado e tente novamente por favor.",
            );
          } on DisabledUserFirebaseException {
            dialog(
              context,
              "Parece que seu usuario foi desabilitado.",
            );
          } on InexistentEmailFirebaseException {
            dialog(
              context,
              "Parece que o seu e-mail é inexistente.",
            );
          } on InvalidPasswordFirebaseException {
            dialog(
              context,
              "Parece que sua senha é inválida.",
            );
          } catch (e) {
            dialog(
              context,
              "Na verdade não sei o que ocorreu, mas por favor tente novamente mais tarde.",
            );
          }
        },
        child: Text('Cadastrar'),
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
