import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 10, 2, 24),
        child: Column(
          children: <Widget>[
            Text(
              "Olá lindx! \u{1F60D}\nVocê é um listinha agora, e nunca mais vai esquecer de comprar nada. "
                  "\nTenha uma listinha compartilhada. \u{1F643}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
