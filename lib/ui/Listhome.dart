import 'package:api_list/cubit/product_cubit.dart';
import 'package:api_list/model/productmodel.dart';
import 'package:api_list/services/services.dart';
import 'package:api_list/ui/CreateNew.dart';
import 'package:api_list/ui/productlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class ListApi extends StatelessWidget {
  late List<Productmodel> createlist;

  @override
  Widget build(BuildContext context) {
    context.read<ProductCubit>().getdatas(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Api"),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateNew()));
              },
              child: Text("Create New"))
        ],
      ),
      body: Container(
        child: Center(
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              return FutureBuilder<List<Productmodel>>(
                  future: state.futureproducts,
                  builder: (context, snapshot) {
                    // this.createlist = snapshot.data!;
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return snapshot.hasData
                        ? ProductList(itemslist: snapshot.data!)
                        : CircularProgressIndicator();
                  });
            },
          ),
        ),
      ),
    );
  }
}
