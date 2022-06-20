import 'dart:convert';

import 'package:api_list/model/productmodel.dart';
import 'package:http/http.dart' as http;

List<Productmodel> parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<Productmodel>((json) => Productmodel.fromJson(json))
      .toList();
}
