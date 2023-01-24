import 'package:api_first/api_provider.dart';
import 'package:api_first/componant/categories.dart';
import 'package:api_first/componant/product_list.dart';
import 'package:api_first/models/product.dart';
import 'package:api_first/views/favorite_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../componant/slider.dart';

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Consumer<ApiProvider>(
     builder: (context , provider , widget) {
       return Scaffold(
        appBar: AppBar(title: Text("TestApi"), 
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavoritePage(),));
          }, icon: Icon(Icons.favorite))
        ]),
        body: Column(
          children: [
            SilderPart(provider.imagesSlider),
            const SizedBox(height: 20,),
            SizedBox(width: double.infinity , height: 40, child: CategoriesPart(provider.categories)),
            const SizedBox(height: 20,),
            Expanded(child: ProductPart(provider.products))
          ],
        ),
       );
     }
   );
  }

}