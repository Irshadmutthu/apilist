import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/retry.dart';

class CustomElevatedButton extends StatelessWidget {
  String buttonname;
  Function onpressed;

  CustomElevatedButton(
      {Key? key, required this.buttonname, required this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onpressed();
        },
        child: Text(buttonname));
  }
}
