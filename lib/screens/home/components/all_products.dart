import 'package:flutter/material.dart';
import 'package:shop_app/components/my_product_card.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/networking/dio_client.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final DioClient _dio = DioClient();
  List items;
  bool _isloading = true;
  getProducts() async {
    items = await _dio.getItems();
    setState(() {
      _isloading = false;
    });
    print(_isloading);
    print('+++++++++++++++++++');
    print(items);
  }

  @override
  void initState() {
    // TODO: implement initState
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "All Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: _isloading
              ? CircularProgressIndicator()
              : Row(
                  children: [
                    ...List.generate(
                      demoProducts.length,
                      (index) {
                        return MyProductCard(product: items[index]);

                        // here by default width and height is 0
                      },
                    ),
                    SizedBox(width: getProportionateScreenWidth(20)),
                  ],
                ),
        )
      ],
    );
  }
}
