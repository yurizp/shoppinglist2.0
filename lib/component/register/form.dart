import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_list_20/component/communs/circle_image_avatar.dart';
import 'package:shopping_list_20/component/register/input_string.dart';
import 'package:shopping_list_20/component/register/send_button.dart';
import 'package:shopping_list_20/model/user.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterForm();
  }
}

class _RegisterForm extends State<RegisterForm> {
  final TextEditingController _textEditingControllerPassword =
      new TextEditingController();
  final TextEditingController _textEditingControllerComparePassword =
      new TextEditingController();
  final TextEditingController _textEditingControllerEmail =
      new TextEditingController();
  final TextEditingController _textEditingControllerFullName =
      new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  User _user = null;
  Image _image = null;

  @override
  void setState(VoidCallback fn) {
    super.initState();
    this._user = new User(
      _textEditingControllerPassword.text,
      _textEditingControllerFullName.text,
      _textEditingControllerEmail.text,
      _textEditingControllerComparePassword.text,
      _image,
    );
    this.build(context);
  }


  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
          child: Column(children: <Widget>[
            GestureDetector(
              child: CircleAvatarImage(_image),
              onTap: getImage,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Tire sua foto!"),
            ),
            InputString(
              "Seu nome ",
              hint: "Marianx Silva",
              maxLenght: 100,
              controller: this._textEditingControllerFullName,
              onChanged: (context) => {
                setState(() {
                  _user = null;
                }),
              },
            ),
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
            InputString(
              "Confime a senha",
              controller: this._textEditingControllerComparePassword,
              maxLenght: 12,
              obscureText: true,
              onChanged: (context) => {
                setState(() {
                  _user = null;
                }),
              },
            ),
            RegisterUserInFirebaseButton(
              "Continuar",
              _formKey,
              _user,
//              edgeInsets: EdgeInsets.fromLTRB(0, 40, 0, 0),
            ),
          ]),
        ));
  }

  Future getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    this._image = Image.file(image);
    setState(() {
      _user = null;
    });
  }
}
