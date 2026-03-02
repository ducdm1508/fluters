import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>{
  Product? product;
  String? tb;
  @override
  void initState() {
    super.initState();
    loadProduct();
  }
  Future<void> loadProduct() async {
    final String res = await rootBundle.loadString("lib/assets/data/product_data.json");
    final List<dynamic> data = json.decode(res);
    List<Product> products = data.map((item) => Product.formJson(item)).toList();

    Product find = products.firstWhere((p) => p.id == widget.productId);
    setState(() {
      product = find;
    });

  }
  @override
  Widget build(BuildContext context) {

    if (product == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(product!.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product!.img,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product!.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),),
                Text(
                  "\$${product!.price}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

              ],
            ),

            SizedBox(height: 10),
            Text("Location, City", style: TextStyle(
              fontSize: 23
            ),),
            SizedBox(height: 30),
            Padding(padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.schedule,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(
                          color: Colors.black,
                          width: 2
                      ),
                    ),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(
                          color: Colors.black,
                          width: 2
                      ),
                    ),
                    child: Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Text("Description",
            style: TextStyle(
              fontSize: 24,
              fontWeight:  FontWeight.bold
            ),),
            SizedBox(height: 15),
            Text(product!.description),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          tb = "chack out ok ";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 15),

                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        tb = "đã thích ok";
                      });
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            if (tb != null)
              Text(tb!)
          ],
        ),
      ),

    );
  }
}
