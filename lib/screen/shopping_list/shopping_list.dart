import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_20/component/communs/app_name.dart';
import 'package:shopping_list_20/component/shopping_list/list_of_shoppings.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppName(),
        backgroundColor: Colors.white,
      ),
      body: ListOfShoppings(),
    );
  }
}
