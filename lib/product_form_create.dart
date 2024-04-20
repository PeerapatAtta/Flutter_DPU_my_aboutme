import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductFromCreate extends StatefulWidget {
  const ProductFromCreate({super.key});

  @override
  State<ProductFromCreate> createState() => _ProductFromCreateState();
}

class _ProductFromCreateState extends State<ProductFromCreate> {
  final dio = Dio();
  final baseApi = "https://testpos.trainingzenter.com/lab_dpu/product/create/";
  final productName = TextEditingController();
  final productCover = TextEditingController();
  final productDescription = TextEditingController();
  final productPrice = TextEditingController();
  late String productOwner = "66130151";
  late String msg = "";

  Future<dynamic> ProductCreate() async {
    if (productName.text == '' ||
        productCover.text == '' ||
        productDescription.text == '' ||
        productPrice.text == '') {
      setState(() {
        msg = "Please add all product data";
      });
      return false;
    }
    try {
      await dio
          .post(baseApi,
              data: {
                "product_name": productName.text,
                "product_cover": productCover.text,
                "product_description": productDescription.text,
                "product_price": productPrice.text,
                "product_owner": productOwner
              },
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json'
                },
              ))
          .then((response) => {Navigator.pushNamed(context, "product")});
    } catch (e) {
      if (!context.mounted) return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Add Product'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (msg != "")
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    msg,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: productName,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Product Name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: productCover,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Product Cover"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: productDescription,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Product Description"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: productPrice,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Product Price"),
                ),
              ),
              TextButton(
                  onPressed: ProductCreate,
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                  child: Text(
                    "Save data",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          ),
        ));
  }
}
