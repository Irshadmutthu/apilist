import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:api_list/model/productmodel.dart';
import 'package:api_list/services/service_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Cutom_Exceptions/customexceptions.dart';

Future<List<Productmodel>> fetchProduct(BuildContext context) async {
  try {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if (response.statusCode == 200) {
      return parseProducts(response.body);
    } else if (response.statusCode == 404) {
      CustomExceptions.Exception404(context);
      return Future.value();
    } else {
      return Future.value();
    }
  } on SocketException catch (e) {
    print(e.toString());
    throw CustomExceptions.NoInternetException(context, e);
    //ScaffoldMessenger.of(context).showSnackBar(snack);
  } on HttpException catch (message) {
    throw CustomExceptions.NoServiceFoundException(context, message);
  } on FormatException catch (message) {
    throw CustomExceptions.InvalidFormatException(context, message);
  } on TimeoutException catch (e) {
    throw CustomExceptions.TimeoutException(context);
  }
}
//
//
//SUBMIT

dynamic submitproduct(Productmodel productmodel, BuildContext context) async {
  try {
    dynamic res;
    final response =
        await http.post(Uri.parse('https://fakestoreapi.com/products'), body: {
      'title': productmodel.title,
      'image': productmodel.image,
      'category': productmodel.category
    });

    if (response.statusCode == 200) {
      var data = response.body;
      print(data);

      Customsnackbar(context: context, SnackMessage: "Product Inserted");
      print(response.body);
      res = Productmodel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      CustomExceptions.Exception404(context);

      res = null;
    } else {
      res = null;
    }
    return res;
  } on SocketException catch (e) {
    print(e.toString());
    throw CustomExceptions.NoInternetException(context, e);
  } on HttpException catch (message) {
    throw CustomExceptions.NoServiceFoundException(context, message);
  } on FormatException catch (message) {
    throw CustomExceptions.InvalidFormatException(context, message);
  } catch (message) {
    throw CustomExceptions.UnknownException(context, message);
  }
}
//
//

//

dynamic updateApi(Productmodel productmodel, BuildContext context) async {
  dynamic updateresult;
  try {
    final response = await http.put(
        Uri.parse('https://fakestoreapi.com/products/${productmodel.id}'),
        body: {
          'title': productmodel.title,
          'category': productmodel.category,
          'image': productmodel.image
        });

    if (response.statusCode == 200) {
      print("edited title ${productmodel.title}");

      Customsnackbar(context: context, SnackMessage: "Edit Successfull");
      updateresult = Productmodel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      CustomExceptions.Exception404(context);

      updateresult = null;
    } else {
      updateresult = null;
    }
  } on SocketException catch (e) {
    print(e.toString());
    throw CustomExceptions.NoInternetException(context, e);
  } on HttpException catch (message) {
    throw CustomExceptions.NoServiceFoundException(context, message);
  } on FormatException catch (message) {
    throw CustomExceptions.InvalidFormatException(context, message);
  } catch (message) {
    throw CustomExceptions.UnknownException(context, message);
  }
  return updateresult;
}

///
//
//delete
dynamic deleteApi(int? id, BuildContext context) async {
  print(id);
  dynamic result;
  try {
    final http.Response response = await http.delete(
      Uri.parse('https://fakestoreapi.com/products/$id'),
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      print("Product deleted in api");
      // print(response.body);
      Customsnackbar(context: context, SnackMessage: "Product Deleted");
      //result = Productmodel.fromjson(jsonDecode(response.body));
      result = Productmodel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      CustomExceptions.Exception404(context);
      result = null;
    } else {
      result = null;
    }
    print(result);
    return result;
  } on SocketException catch (e) {
    print(e.toString());
    throw CustomExceptions.NoInternetException(context, e);
  } on HttpException catch (message) {
    throw CustomExceptions.NoServiceFoundException(context, message);
  } on FormatException catch (message) {
    throw CustomExceptions.InvalidFormatException(context, message);
  } catch (message) {
    throw CustomExceptions.UnknownException(context, message);
  }
}
//

Customsnackbar({required BuildContext context, String? SnackMessage}) {
  final snackbar = SnackBar(
    content: Text(SnackMessage!),
    duration: Duration(milliseconds: 700),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
