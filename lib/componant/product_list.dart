import 'package:api_first/api_provider.dart';
import 'package:api_first/models/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPart extends StatelessWidget{
  List<Product> products;
  ProductPart(this.products);
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context , provider , widget) {
        return products.isEmpty ?
        const Center(child: CircularProgressIndicator(),) :
        GridView.builder(
          itemCount: products.length,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
           itemBuilder: (context, index) {
             return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.amber
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              height: 130,
              child: Stack(
                children: [
                  Column(
                    children: [
                      CachedNetworkImage(
                        height: 120,
                        width: 120,
                        imageUrl:products[index].image!
                        ),
                       const SizedBox(height: 10,),
                       SizedBox(height: 20, child: Text(products[index].title!)) 
                    ],
                  ),
                   Positioned(
                    top: 0,
                    right: 0,
                     child: IconButton(onPressed:() {
                        provider.updateProduct(products[index]);
                      }, icon: Icon(Icons.favorite , color: products[index].isFav! ? Colors.red : Colors.grey,)),
                   ),
                ],
              ),
             );
           },);
      }
    );
  }

}