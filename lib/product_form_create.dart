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
  final projectName = TextEditingController();
  final projectCover = TextEditingController();
  final projectDescription = TextEditingController();
  final projecPrice = TextEditingController();
  late String prjectOwner = "66130151";
  late String msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Add Product'),
      ),
    );
  }
}
