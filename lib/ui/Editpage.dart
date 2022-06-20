import 'package:api_list/cubit/product_cubit.dart';
import 'package:api_list/ui/Listhome.dart';
import 'package:api_list/ui/productlist.dart';
import 'package:api_list/model/productmodel.dart';
import 'package:api_list/services/services.dart';
import 'package:api_list/widgets/customElevated.dart';
import 'package:api_list/widgets/customtextformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Editpage extends StatelessWidget {
  late List<Productmodel> editlist;
  int index;
  Editpage({Key? key, required this.editlist, required this.index})
      : super(key: key);

  setData() {
    titlecontroller.text = editlist[index].title.toString();
    idcontroller.text = editlist[index].id.toString();
    imagecontroller.text = editlist[index].image.toString();
  }

  TextEditingController titlecontroller = TextEditingController();
  TextEditingController idcontroller = TextEditingController();
  TextEditingController imagecontroller = TextEditingController();
  TextEditingController catogorycontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    setData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Api"),
      ),
      body: Center(
        child: Form(
          key: formkey,
          child: Container(
            height: 300,
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextfield(
                        controller: titlecontroller,
                        validator: Validator.defaultValidator,
                        defaultErrorMessage: "Empty title",
                        // onfieldsubmit: (value) {
                        //   if (formkey.currentState!.validate()) return;
                        // },
                        // onChange: (value) {
                        //   if (formkey.currentState!.validate()) return;
                        // },
                        labeltext: "Title",
                        hinttext: "Enter title"),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(
                        controller: imagecontroller,
                        validator: Validator.defaultValidator,
                        defaultErrorMessage: "Empty title",
                        // onfieldsubmit: (value) {
                        //   if (formkey.currentState!.validate()) return;
                        // },
                        // onChange: (value) {
                        //   if (formkey.currentState!.validate()) return;
                        // },
                        labeltext: "Image url",
                        hinttext: "Enter image Url"),
                    SizedBox(
                      height: 10,
                    ),
                    CustomElevatedButton(
                        buttonname: "update",
                        onpressed: () async {
                          if (formkey.currentState!.validate()) {
                            int id = editlist[index].id!;
                            String catogory = catogorycontroller.text;
                            String titlee = titlecontroller.text;
                            String image = imagecontroller.text;
                            Productmodel productmodel = Productmodel(
                              title: titlee,
                              image: image,
                              id: id,
                              category: catogory,
                            );
                            editlist[index] = productmodel;

                            // editlist.replaceRange(index, index, [productmodel]);
                            dynamic result = await context
                                .read<ProductCubit>()
                                .updateData(productmodel, context,
                                    Future.value(editlist));

                            print(result);

                            await Future.delayed(Duration(milliseconds: 1000));
                            // if (result != null) {
                            //  // Navigator.pop(context);
                            // }

                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => ListApi()));
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
