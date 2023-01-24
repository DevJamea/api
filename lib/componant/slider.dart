import 'package:api_first/models/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SilderPart extends StatelessWidget{
  final List<Product> products ;
  const SilderPart(this.products);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/4,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true
        ),
        items: products.map((e) {
          return CachedNetworkImage(
            imageUrl: e.image!,

          );
        }).toList()
        ),
    );
  }


}