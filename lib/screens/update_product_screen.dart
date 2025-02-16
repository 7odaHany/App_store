import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_filed.dart';

class UpdateProudectPage extends StatefulWidget {
  UpdateProudectPage({super.key});
  static String id = 'update_product';

  @override
  State<UpdateProudectPage> createState() => _UpdateProudectPageState();
}

class _UpdateProudectPageState extends State<UpdateProudectPage> {
  String? productTitle, productDescription, productImage, productPrice;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  onChanged: (value) {
                    productTitle = value;
                  },
                  hintText: 'title',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (value) {
                    productDescription = value;
                  },
                  hintText: 'description',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  inputType: TextInputType.number,
                  onChanged: (value) {
                    productPrice = value;
                  },
                  hintText: 'price',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (value) {
                    productImage = value;
                  },
                  hintText: 'image',
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                    text: 'Update',
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await updateProduct(product);
                        print("success");
                      } on Exception catch (e) {
                        print(e.toString());
                      }
                      setState(() {
                        isLoading = false;
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      id: product.id,
      title: productTitle == null ? product.title : productTitle!,
      price: productPrice == null ? product.price.toString() : productPrice!,
      desc: productDescription == null ? product.description : productDescription!,
      image: productImage == null ? product.image : productImage!,
      category: product.category,
    );
  }
}
