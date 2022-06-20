import 'package:api_list/model/productmodel.dart';
import 'package:api_list/services/services.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  getdatas(BuildContext context) =>
      emit(ProductState(futureproducts: getAlldataService(context)));

  dynamic updateData(Productmodel productmodel, BuildContext context,
      Future<List<Productmodel>> editlist) async {
    dynamic result = await updateservice(productmodel, context);
    if (result != null) {
      emit(ProductState(futureproducts: editlist));
      Navigator.pop(context);
    } else {}
    // return result;
  }

  postData(
    Productmodel productmodel,
    BuildContext context,
    Future<List<Productmodel>> submitlist,
    // List<Productmodel> createlist,
  ) async {
    dynamic res = await postapiService(productmodel, context);
    if (res != null) {
      emit(ProductState(futureproducts: submitlist));
      Navigator.pop(context);
    } else {}
  }

  deleteData(
      int id, BuildContext context, Future<List<Productmodel>> model) async {
    // emit(ProductState(futureproducts: model));

    dynamic res = await deleteapiService(id, context);
    print("result ${res}");
    if (res != null) {
      emit(ProductState(futureproducts: model));
    } else {}
  }
}
