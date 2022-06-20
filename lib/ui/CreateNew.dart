import 'dart:ffi';

import 'package:api_list/model/productmodel.dart';
import 'package:api_list/services/services.dart';
import 'package:api_list/ui/Listhome.dart';
import 'package:api_list/ui/productlist.dart';
import 'package:api_list/widgets/customElevated.dart';
import 'package:api_list/widgets/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/product_cubit.dart';

class CreateNew extends StatelessWidget {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController catogorycontroller = TextEditingController();
  TextEditingController imagecontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // List<Productmodel> createlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New "),
      ),
      body: Center(
        child: Container(
          height: 500,
          child: Card(
            elevation: 10,
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextfield(
                      validator: Validator.defaultValidator,
                      defaultErrorMessage: "Empty title",
                      // onfieldsubmit: (value) async {
                      //   if (formkey.currentState!.validate()) return;
                      // },
                      // onChange: (value) {
                      //   if (formkey.currentState!.validate()) return;
                      // },
                      controller: titlecontroller,
                      labeltext: "Title",
                      hinttext: "Enter title"),

                  SizedBox(
                    height: 10,
                  ),
                  CustomTextfield(
                      validator: Validator.defaultValidator,
                      defaultErrorMessage: "Empty image URL",
                      // onfieldsubmit: (value) async {
                      //   if (formkey.currentState!.validate()) return;
                      // },
                      // onChange: (value) {
                      //   if (formkey.currentState!.validate()) return;
                      // },
                      controller: imagecontroller,
                      labeltext: "Image",
                      hinttext: "Enter image url"),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextfield(
                      validator: Validator.defaultValidator,
                      defaultErrorMessage: "Empty price",
                      // onfieldsubmit: (value) async {
                      //   if (formkey.currentState!.validate()) return;
                      // },
                      // onChange: (value) {
                      //   if (formkey.currentState!.validate()) return;
                      // },
                      controller: catogorycontroller,
                      labeltext: "Catogory",
                      hinttext: "Enter catogory"),
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(50)),
                  //       label: Text("Image"),
                  //       hintText: "Enter title"),
                  //   controller: imagecontroller,
                  // ),
                  BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      return CustomElevatedButton(
                          buttonname: "Create",
                          onpressed: () async {
                            if (formkey.currentState!.validate()) {
                              String title = titlecontroller.text;
                              String image = imagecontroller.text;
                              String catogory = catogorycontroller.text;
                              Productmodel productmodell = Productmodel(
                                  id: 21,
                                  title: title,
                                  image: image,
                                  category: catogory);

                              List<Productmodel> submitlist =
                                  await state.futureproducts!;
                              submitlist.add(productmodell);
                              print(productmodell.title);

                              context.read<ProductCubit>().postData(
                                    productmodell,
                                    context,
                                    Future.value(submitlist),
                                  );
                              await Future.delayed(Duration(milliseconds: 700));
                            }
                          });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
