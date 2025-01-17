import 'package:flutter/material.dart';

class LoadingIndicatorDialog {
  static final LoadingIndicatorDialog _singleton =
      LoadingIndicatorDialog._internal();
  late BuildContext _context;
  bool isDisplayed = false;

  factory LoadingIndicatorDialog() {
    return _singleton;
  }

  LoadingIndicatorDialog._internal();

  show(BuildContext context, {String text = 'Loading...'}) {
    if (isDisplayed) {
      return;
    }
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _context = context;
          isDisplayed = true;
          return WillPopScope(
              onWillPop: () async => false,
              child:
                  const SimpleDialog(backgroundColor: Colors.transparent, children: [
                Center(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(color: Color(0xFF1AB00A))
                      ]),
                )
              ]));
        });
  }

  dismiss() {
    if (isDisplayed) {
      Navigator.of(_context).pop();
      isDisplayed = false;
    }
  }
}
