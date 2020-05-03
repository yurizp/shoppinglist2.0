import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:shopping_list_20/component/register/input_string.dart';

class DateInput extends StatelessWidget {
  final DateFormat format = DateFormat("dd/MM/yyyy");
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InputString(
      "Data de nascimento",
      controller: _controller,
      onTap: () => showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        initialDate: DateTime.now(),
        lastDate: DateTime.now(),
      ).then((date) {
        _controller.text = format.format(date).toString();
        FocusScope.of(context).requestFocus(FocusNode());
      }),
    );
  }
}
