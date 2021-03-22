// colors picked from: https://github.com/enviroCar/enviroCar-app/blob/master/org.envirocar.app/res/values/colors_cario.xml

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarioColors {
  static Color pressedCario = Color(0xFF8CBF3F);
  static Color actionbarTitleFontCario = Color(0xFFFFFFFF);

  static Color blueDarkCario = Color(0xFF0065A0);
  static MaterialColor materialBlueDarkCario = MaterialColor(0xFF0065A0, {
    50: blueDarkCario.withOpacity(0.1),
    100: blueDarkCario.withOpacity(0.2),
    200: blueDarkCario.withOpacity(0.3),
    300: blueDarkCario.withOpacity(0.4),
    400: blueDarkCario.withOpacity(0.5),
    500: blueDarkCario.withOpacity(0.6),
    600: blueDarkCario.withOpacity(0.7),
    700: blueDarkCario.withOpacity(0.8),
    800: blueDarkCario.withOpacity(0.9),
    900: blueDarkCario.withOpacity(1.0)
  });

  static Color blueLightCario = Color(0xFF048ABF);
  static Color carioColorPrimaryDark = Color(0XFFFF01456C);
  static Color carioWarningRed = Color(0xFFB00020);
}
