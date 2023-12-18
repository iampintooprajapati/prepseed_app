import 'package:flutter/material.dart';

class AppToast {
  static final AppToast instance = AppToast._internal();

  factory AppToast(BuildContext context) {
    return instance;
  }
  AppToast._internal();
  showError(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          // fontFamily: KSMFontFamily.robotomedium,
          fontSize: 12,
        ),
      ),
      backgroundColor: Colors.red[400],
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      // behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 2000),
      dismissDirection: DismissDirection.horizontal,

      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    ));
  }

  showSuccess(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
          // fontFamily: KSMFontFamily.robotomedium
        ),
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 2000),
      elevation: 10,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    ));
  }

  // showLoader() {
  //   return Center(
  //       child: LoadingAnimationWidget.threeArchedCircle(
  //     color: MyApp.themeNotifier.value == ThemeMode.dark
  //         ? Colors.white
  //         : Colors.black,
  //     size: 40,
  //   ));
  // }

  // void showLoading(BuildContext context) {
  //   SmartDialog.showLoading(
  //       animationType: SmartAnimationType.fade,
  //       backDismiss: true,
  //       useAnimation: true,
  //       usePenetrate: true,
  //       msg: "Loading");
  // }

  // void dismiss() {
  //   SmartDialog.dismiss();
  // }
}
