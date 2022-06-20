import 'package:api_list/cubit/product_cubit.dart';
import 'package:api_list/ui/Listhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(ListApimain());
}

class ListApimain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: MaterialApp(
        home: ListApi(),
      ),
    );
  }
}
