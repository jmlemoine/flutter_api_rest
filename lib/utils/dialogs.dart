import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ProgressDialog {
  static show(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return WillPopScope(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white.withOpacity(0.9),
                child: Center(
                  child: CircularProgressIndicator(),
                )),
            onWillPop: () async => false,
          );
          /*return ;*/
        });
  }

  static dismisss(BuildContext context) {
    Navigator.pop(context);
  }
}
