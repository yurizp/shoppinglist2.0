import 'package:flutter/cupertino.dart';

class User {
  final String password;
  final String confirmPassword;
  final String fullName;
  final String email;
  final Image image;

  User(this.password, this.fullName, this.email, this.confirmPassword,
      this.image);
}
