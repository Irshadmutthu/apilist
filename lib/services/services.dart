import 'package:api_list/api_gateway/api_gateway.dart';
import 'package:api_list/model/productmodel.dart';
import 'package:flutter/cupertino.dart';

late List<Productmodel> productEditlist;

Future<List<Productmodel>> getAlldataService(BuildContext context) async {
  return productEditlist = await fetchProduct(context);
}

dynamic updateservice(Productmodel productmodel, BuildContext context) async {
  dynamic result = await updateApi(productmodel, context);
  return result;
}

dynamic postapiService(Productmodel productmodel, BuildContext context) async {
  dynamic result = await submitproduct(productmodel, context);
  return result;
}

dynamic deleteapiService(int id, BuildContext context) async {
  dynamic result = await deleteApi(id, context);
//  print('Service result$result');
  return result;
}
