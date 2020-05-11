import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListOfShoppings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListOfShoppings();
  }

  ListOfShoppings({Key key}) : super(key: key);
}

class _ListOfShoppings extends State<ListOfShoppings> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MyStatelessWidget(),
        MyStatelessWidget(),
        MyStatelessWidget(),
        MyStatelessWidget(),
        MyStatelessWidget(),
        MyStatelessWidget(),
        MyStatelessWidget(),
        MyStatelessWidget(),
      ],
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.green,
                size: 40,
              ),
              title: Text(
                "Lista mercado",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                "Compatilhada com Luana",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
