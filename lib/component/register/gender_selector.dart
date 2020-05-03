import 'package:flutter/cupertino.dart';
import 'package:gender_selector/gender_selector.dart';

class GenderSelectorForm extends StatelessWidget {
  final Gender _selectedGender;

  @override
  Widget build(BuildContext context) {
    return GenderSelector(
      margin: EdgeInsets.only(
        left: 10,
        top: 30,
        right: 10,
        bottom: 10,
      ),
      selectedGender: Gender.FEMALE,
      onChanged: (gender) async {
        setState(() {
          if (gender == Gender.FEMALE) {

          } else {
            debugPrint("selectedGender");
          }
        });
      },
    );
  }
}
