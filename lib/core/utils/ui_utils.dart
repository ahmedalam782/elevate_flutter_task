import 'package:elevate_flutter_task/core/resources/color_manager.dart';
import 'package:elevate_flutter_task/core/resources/font_manager.dart';
import 'package:elevate_flutter_task/core/resources/styles_manager.dart';
import 'package:elevate_flutter_task/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiUtils {
  static void showLoadingDialog(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => PopScope(
          canPop: false,
          child: AlertDialog(
              backgroundColor: ColorManager.white,
              content: SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width * .01,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingIndicator(),
                  ],
                ),
              )),
        ),
      );
  static void showConnectionDialog(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => PopScope(
          canPop: false,
          child: AlertDialog(
            title: Text(
              "Connection Problem",
              style: getBoldStyle(
                  color: ColorManager.primary, fontSize: FontSize.s24),
            ),
            backgroundColor: ColorManager.white,
            content: Text(
              "Something went wrong.\nplease check your internet connection and try again.",
              style: getSemiBoldStyle(
                  color: ColorManager.black, fontSize: FontSize.s12),
            ),
            actions: [
              TextButton(
                child: Text(
                  "OK",
                  style: getBoldStyle(
                      color: ColorManager.primary, fontSize: FontSize.s16),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );

  static void hideLoadingDialog(BuildContext context) => Navigator.pop(context);
  static void showMessageToast(String message) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorManager.white,
        textColor: ColorManager.black,
        fontSize: FontSize.s16,
      );
}
