import 'package:flutter/cupertino.dart';

class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 100, 8, 8),
      child: Image.asset(
        'assets/images/logo_bigger.png',
        width: 150,
      ),
    );
  }
}
