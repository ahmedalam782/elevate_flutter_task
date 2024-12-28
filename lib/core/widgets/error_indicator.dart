import 'package:elevate_flutter_task/core/resources/color_manager.dart';
import 'package:elevate_flutter_task/core/resources/font_manager.dart';
import 'package:elevate_flutter_task/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * .09),
        child: Text(
          message ?? " SomeThing went Wrong!",
          style:
              getMediumStyle(color: ColorManager.black, fontSize: FontSize.s14),
        ),
      ),
    );
  }
}
