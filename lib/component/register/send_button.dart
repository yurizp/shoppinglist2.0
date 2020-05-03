import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final String title;

  SendButton(this.title, this._formKey);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Processing Data')));
        }
      },
      child: Text('Cadastrar'),
    );
  }
}
