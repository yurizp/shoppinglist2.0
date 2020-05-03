import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppName extends StatelessWidget {
  final double size;
  final EdgeInsets edgeInsets;

  AppName({this.size, this.edgeInsets});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.edgeInsets == null ? EdgeInsets.all(8) : edgeInsets,
      child: Center(
        child: Text(
          "Listinha",
          style: TextStyle(
            color: Colors.black,
            fontSize: this.size == null ? 16 : this.size,
          ),
        ),
      ),
    );
  }
}
