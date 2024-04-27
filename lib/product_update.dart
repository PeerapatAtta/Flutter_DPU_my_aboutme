import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductUpdate extends StatefulWidget {
  const ProductUpdate({super.key, required this.productId});
  final String productId;

  @override
  State<ProductUpdate> createState() => _ProductUpdateState();
}

class _ProductUpdateState extends State<ProductUpdate> {
  final dio = Dio();
  final baseApi = "https://testpos.trainingzenter.com/lab_dpu/product/update/";
  final productName = TextEditingController();
  final productCover = TextEditingController();
  final productDescription = TextEditingController();
  final productPrice = TextEditingController();
  late String productOwner = "66130151";
  late String msg = "";

  @override
  void initState() {
    super.initState();
    getSingleProduct();
  }

  Future<dynamic> getSingleProduct() async {
    try {
      await dio
          .get(baseApi + widget.productId,
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json'
                },
              ))
          .then((response) => {
                if (response.statusCode == 200)
                  {
                    setState(() {
                      productName.text = response.data['product_name']!;
                      productCover.text = response.data['product_cover']!;
                      productDescription.text =
                          response.data['product_description']!;
                      productPrice.text = response.data['product_price']!;
                    })
                  }
              });
    } catch (e) {
      if (!context.mounted) return;
    }
  }

  Future<dynamic> ProductUpdate() async {
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
          .put(baseApi + widget.productId,
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
      setState(() {
        msg = "Error. Please recheck data and update again";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Product Update'),
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
                  onPressed: ProductUpdate,
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
