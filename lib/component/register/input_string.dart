import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputString extends StatelessWidget {
  final TextEditingController controller;
  final String _labelText;
  final String hint;
  final IconData iconData;
  final Function onTap;
  final Function validate;
  final int maxLenght;
  final ValueChanged<String> onChanged;
  final bool obscureText;

  InputString(this._labelText,
      {this.controller,
      this.hint,
      this.iconData,
      this.onTap,
      this.validate,
      this.maxLenght,
      this.onChanged,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onTap: this.onTap,
      controller: controller,
      obscureText: this.obscureText == null ? false : this.obscureText,
      maxLength: maxLenght == null ? null : this.maxLenght,
      keyboardType: TextInputType.text,
      style: TextStyle(
        fontSize: 20,
      ),
      decoration: InputDecoration(
        icon: iconData != null ? Icon(iconData) : null,
        labelText: _labelText,
        hintText: hint == null ? null : hint,
      ),
      validator: (value) {
        return validateField(value);
      },
    );
  }

  String validateField(String value) {
    if (value == null || value.length < 5) {
      return "Valor incorreto, por favor preencha o campo.";
    }
    return null;
  }
}
