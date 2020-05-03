import 'package:flutter/material.dart';

class ButtonContinue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {},
        child: Text(
          'Vamos lá!',
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
