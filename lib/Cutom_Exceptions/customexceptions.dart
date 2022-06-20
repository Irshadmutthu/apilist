import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../api_gateway/api_gateway.dart';

class CustomExceptions {
  static NoInternetException(BuildContext context, SocketException e) {
    // final snackbar = SnackBar(content: Text("NO INTERNET ${e.toString()}"));
    // ScaffoldMessenger.of(context).showSnackBar(snackbar);
    Customsnackbar(
        context: context, SnackMessage: "No internet ...${e.toString()}");
  }

  static NoServiceFoundException(BuildContext context, HttpException e) {
    final snackbar =
        SnackBar(content: Text("NO SERVICE FOUND ${e.toString()}"));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static InvalidFormatException(BuildContext context, FormatException e) {
    final snackbar =
        SnackBar(content: Text("Invalid Data Format ${e.toString()}"));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static TimeoutException(BuildContext context) {
    final snackbar = SnackBar(content: Text("No internet "));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static UnknownException(BuildContext context, Object e) {
    final snackbar = SnackBar(content: Text("${e.toString()}"));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static Exception404(BuildContext context) {
    Customsnackbar(context: context, SnackMessage: "404 not found");
  }
}
