import 'package:flutter/material.dart';

import 'package:envirocar_flutter/theme/colors_cario.dart';

class RedCircularButton extends StatelessWidget {
  const RedCircularButton(this.text, this.iconData, this.onPressed, {Key key})
      : super(key: key);

  final String text;
  final IconData iconData;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: CarioColors.carioWarningRed,
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              icon: Icon(
                iconData,
                color: Colors.white,
              ),
              onPressed: onPressed,
            ),
          ),
          Text(text),
        ],
      ),
    );
  }
}
