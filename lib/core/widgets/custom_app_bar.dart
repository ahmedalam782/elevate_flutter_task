import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String title,
  TextStyle? style,
  bool automaticallyImplyLeading = false,
  void Function()? onTap,
  List<Widget>? actions,
}) {
  return AppBar(
    automaticallyImplyLeading: automaticallyImplyLeading,
    title: Text(
      title,
      style: style ??
          getBoldStyle(
            color: ColorManager.white,
            fontSize: FontSize.s16,
          ),
    ),
    centerTitle: true,
    backgroundColor: ColorManager.primary,
    elevation: 0,
    actions: actions ?? [],
  );
}
