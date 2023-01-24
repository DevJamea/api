import 'package:api_first/api_provider.dart';
import 'package:api_first/componant/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context , provider , widget) {
        return Scaffold(
          body:
          provider.favorites.isEmpty ?
          const Center(child: Text('No Data'),) :
           SizedBox(width: double.infinity, child: ProductPart(provider.favorites)),
        );
      }
    );
  }

}