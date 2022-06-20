import 'package:api_list/api_gateway/api_gateway.dart';
import 'package:api_list/cubit/product_cubit.dart';
import 'package:api_list/services/services.dart';
import 'package:api_list/ui/Editpage.dart';
import 'package:api_list/model/productmodel.dart';
import 'package:api_list/widgets/customElevated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  final List<Productmodel> itemslist;
  const ProductList({Key? key, required this.itemslist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemslist.length,
        itemBuilder: ((context, index) {
          return Card(
            elevation: 10,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    itemslist[index].title.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text("Catogory : ${itemslist[index].category}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                      "Price : ${itemslist[index].price.toStringAsFixed(1)}"),
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                        image: NetworkImage(itemslist[index].image!),
                        fit: BoxFit.contain),
                  ),
                ),
                Row(
                  children: [
                    CustomElevatedButton(
                        buttonname: "Edit",
                        onpressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Editpage(
                                        index: index,
                                        editlist: itemslist,
                                      )));
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    CustomElevatedButton(
                        buttonname: "Delete",
                        onpressed: () {
                          int id = itemslist[index].id!;
                          //
                          //   print(itemslist[index].title);
                          // print('id$id');
                          print('before${itemslist.length}');

                          print('after${itemslist.length}');
                          itemslist.removeAt(index);
                          context
                              .read<ProductCubit>()
                              .deleteData(id, context, Future.value(itemslist));
                        }),
                  ],
                ),
              ],
            ),
          );
        }));
  }
}
