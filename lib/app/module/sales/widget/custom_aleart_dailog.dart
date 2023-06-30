import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customShowAboutDialog(BuildContext context, String title, descrip,
    Function() yesButton, noButton) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("No"),
    onPressed: () {
      noButton();
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Yes"),
    onPressed: () {
      yesButton();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(descrip),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  Platform.isAndroid
      ? showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        )
      : showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text(title),
                content: Text(descrip),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: const Text("No"),
                    onPressed: () {
                      noButton();
                    },
                  ),
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: const Text("Yes"),
                    onPressed: () {
                      yesButton();
                    },
                  ),
                ],
              ));
}
