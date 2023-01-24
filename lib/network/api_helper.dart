import 'dart:developer';

import 'package:api_first/models/product.dart';
import 'package:dio/dio.dart';

class ApiHelper{
  ApiHelper._();
  static ApiHelper instance = ApiHelper._();
  Dio dio = Dio();

  Future<List<String>> getAllcategories()async{
    Response response = await dio.get('https://fakestoreapi.com/products/categories');
    List list = response.data;
    List<String> categories = list.map((e) => e.toString()).toList(); 
    log(categories.toString());
    return categories;
  }

  Future<List<Product>> getAllProducts()async{
    Response response = await dio.get('https://fakestoreapi.com/products');
    List list =  response.data;
    List<Product> products = list.map((e){
        return Product.fromJson(e);
    }).toList();
    return products;
  }

  Future<Product> getProduct(int productId)async{
    Response response = await dio.get('https://fakestoreapi.com/products/$productId');
    Product product = Product.fromJson(response.data);
    log(product.category!);
    return product;
  }

  Future<List<Product>> getCategoryProducts(String category)async{
    Response response = await dio.get('https://fakestoreapi.com/products/category/$category');
    List list = response.data;
    List<Product> products = list.map((e){
        return Product.fromJson(e);
    }).toList() ;
    log(products.length.toString());
    return products;
  }

  Future<List<Product>> getLimitProducts(int limit)async{
    Response response = await dio.get('https://fakestoreapi.com/products?limit=$limit');
    List list = response.data;
    List<Product> products = list.map((e){
      return Product.fromJson(e);
    }).toList();
    return products;
  }
}