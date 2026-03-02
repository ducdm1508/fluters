import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hw10/main.dart';
import 'package:hw10/models/category.dart';
import 'package:hw10/screens/product_detail_screen.dart';

import '../models/product.dart';

class ProductScreen extends StatefulWidget{
  @override
  State<ProductScreen> createState() {
    return _ProductScreenState();
  }
}

class _ProductScreenState extends State<ProductScreen>{
  List<Category> categories = [];
  List<Product> products = [];
  int selectedCategoryId = 1;
  @override
  void initState() {
    super.initState();
    loadDataCtg();
    loadDataProduct();
  }

  Future<void> loadDataCtg() async {
    final String response = await rootBundle.loadString('lib/assets/data/category_data.json');
    final List<dynamic> data = json.decode(response);

    setState(() {
      categories =
          data.map((item) => Category.fromJson(item)).toList();
    });
  }
  
  Future<void> loadDataProduct() async {
    final String res = await rootBundle.loadString("lib/assets/data/product_data.json");
    final List<dynamic> data = json.decode(res);
    setState(() {
      products = data.map((item) => Product.formJson(item)).toList();
    });
  }

  
  @override
  Widget build(BuildContext context) {
    print(products.length);

    List<Product> filteredProducts = products
        .where((product) => product.categoryId == selectedCategoryId)
        .toList();

    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hello, Mark Adam", style: TextStyle( fontSize: 20) ,),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.supervised_user_circle_outlined,
                        size: 42,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Text("Enjoy Tasty Food In Your Town",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Find Your Meal",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                SizedBox(height: 20,),
                Text("Categories"),
                SizedBox(height: 10,),
                SizedBox(
                  height: 35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedCategoryId = categories[index].id;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 12),
                          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 4),
                          decoration: BoxDecoration(
                            color: selectedCategoryId == categories[index].id ? Colors.black : Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),),

                          child: Center(

                            child: Text(categories[index].name,style: TextStyle(
                              color: selectedCategoryId == categories[index].id ? Colors.white : Colors.black,
                            ),)
                          ),
                        ),
                      );

                    },
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                    child:   GridView.builder(
                    itemCount: filteredProducts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.75,
                        ),

                        itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => ProductDetailScreen(productId: filteredProducts[index].id)
                              )
                              );
                        },
                        child: Card(
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child:
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.star),
                                      Text("${filteredProducts[index].star}")
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Expanded(
                                    child: Center(
                                      child: Image.asset(
                                        filteredProducts[index].img,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(filteredProducts[index].name),
                                            Text("\$${filteredProducts[index].price}")
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          print("đã add he hehe heheh");
                                        },
                                        style: IconButton.styleFrom(
                                          shape: CircleBorder(
                                            side: BorderSide(color: Colors.black, width: 2),
                                          ),
                                        ),
                                        icon: Icon(Icons.add),
                                      ),

                                    ],
                                  )
                                ],
                              )

                          ),
                        ),
                      );
                    }))
              ],
            ),
          )

      ),
    );
  }

}