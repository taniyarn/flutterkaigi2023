import 'package:flutter/cupertino.dart';
import 'package:flutterkaigi2023/styles/fs_colors.dart';

CupertinoThemeData get darkTheme => const CupertinoThemeData(
      brightness: Brightness.dark,
      textTheme:
          CupertinoTextThemeData(primaryColor: FSColors.regularTextColorDark),
    );
