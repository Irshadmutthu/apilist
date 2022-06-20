import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextfield extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String labeltext;
  String hinttext;
  Validator? validator;
  String? defaultErrorMessage;
  Function(String)? onChange;
  Function(String)? onfieldsubmit;

  TextInputType? keyboardtype;
  CustomTextfield(
      {Key? key,
      required this.controller,
      required this.labeltext,
      required this.hinttext,
      this.keyboardtype,
      this.validator,
      this.defaultErrorMessage,
      this.onChange,
      this.onfieldsubmit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardtype,
      validator: (value) {
        switch (validator) {
          case Validator.defaultValidator:
            return emptyValidation(value.toString(), defaultErrorMessage!);
          default:
            print("error");
        }
      },
      onChanged: onChange,
      onFieldSubmitted: onfieldsubmit,
      decoration: InputDecoration(
          label: Text(labeltext),
          hintText: hinttext,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          )),
      controller: controller,
    );
  }
}

dynamic emptyValidation(String value, String errorString) {
  if (value.isEmpty) {
    return errorString;
  }
  return null;
}

enum Validator { defaultValidator }
