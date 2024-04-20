import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_aboutme/product_form_create.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final dio = Dio();
  final baseApi =
      "https://testpos.trainingzenter.com/lab_dpu/product/list/66130151?format=json";
  late List productList = [];

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  Future<void> getProduct() async {
    try {
      await dio
          .get(baseApi,
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                },
              ))
          .then((response) => {
                if (response.statusCode == 200)
                  {
                    setState(() {
                      productList = response.data!;
                    })
                  }
              });
    } catch (e) {
      if (!context.mounted) return;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(productList);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Product'),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductFromCreate()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 9, 210, 19),
                  ),
                  child: Text(
                    'Add Product',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: productList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Image.network(productList[index]["product_cover"]),
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: Text(productList[index]["product_name"]),
                        subtitle:
                            Text('Price: ${productList[index]["update_date"]}'),
                      ),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Updated Date ")),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(25, 177, 252, 1),
                            ),
                            child: Text(
                              'More Detail',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
