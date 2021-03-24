import 'package:flutter/material.dart';

import 'package:envirocar_flutter/theme/colors_cario.dart';

class BlueButton extends StatelessWidget {
  const BlueButton(this.buttonText, this.onPress, {Key key}) : super(key: key);

  final String buttonText;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              CarioColors.carioColorPrimaryDark,
            ),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 15),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: onPress,
          child: Text(buttonText),
        ),
      ),
    );
  }
}
