import 'package:flutter/cupertino.dart';

class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 90, 8, 27),
      child: Image.asset(
        'assets/images/logo_bigger.png',
        height: 120,
      ),
    );
  }
}
