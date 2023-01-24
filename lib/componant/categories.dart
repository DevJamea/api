import 'package:api_first/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesPart extends StatelessWidget{
  List<String> categories;
  CategoriesPart(this.categories);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Provider.of<ApiProvider>(context).selectedCategory == categories[index] ?
               Colors.amber :
               Colors.blueGrey
            ),
            onPressed: () {
            Provider.of<ApiProvider>(context , listen: false).selectCategory(categories[index]);
          }, child: Text(categories[index])),
        );
      },
      );
  }

}