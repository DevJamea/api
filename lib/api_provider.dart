import 'dart:developer';

import 'package:api_first/database_helper.dart';
import 'package:api_first/models/product.dart';
import 'package:api_first/network/api_helper.dart';
import 'package:flutter/cupertino.dart';

class ApiProvider extends ChangeNotifier{

  ApiProvider(){
   initData();
  }

  initData() async{
    await DatabaseHelper.instance.initDatabase().then((value) => getAllFavProducts());
    getAllProducts();
    getAllCategories();
    getImagesSlider();
  }

  List<Product> products = [];
  List<Product> favorites = [];
  List<Product> imagesSlider = [];
  List<String> categories = [];
  String? selectedCategory;

  selectCategory(String category){
    selectedCategory = category;
    if(selectedCategory == "All"){
      products = [];
      getAllProducts();
    }else{
      products = [];
      getCategoryProducts(selectedCategory!);
    }
    notifyListeners();
  }

  getAllCategories()async{
    List<String> list = await ApiHelper.instance.getAllcategories();
    categories.add("All");
    categories.addAll(list);
    selectCategory('All');
    notifyListeners();
  }

  getImagesSlider()async{
    imagesSlider =  await ApiHelper.instance.getAllProducts();
    notifyListeners();
  }

  getAllProducts()async{
    List<Product> list =  await ApiHelper.instance.getAllProducts();
    List<int> idList = favorites.map((e) => e.id!).toList();
    for(Product product in list){
      if(idList.contains(product.id)){
        product.isFav = true;
      }
      products.add(product);
    }
    notifyListeners();
  }

  getProduct(int productId)async{
    await ApiHelper.instance.getProduct(productId);
  }


  getCategoryProducts(String category)async{
    List<Product> list = await ApiHelper.instance.getCategoryProducts(category);
    List<int> idList = favorites.map((e) => e.id!).toList();
    for(Product product in list){
      if(idList.contains(product.id)){
        product.isFav = true;
      }
      products.add(product);
    }
    notifyListeners();
  }

  getLimitProducts(int limit)async{
    await ApiHelper.instance.getLimitProducts(limit);
  }

  addNewProduct(Product product)async{
    await DatabaseHelper.instance.addNewProduct(product);
    getAllFavProducts();
    notifyListeners();
  }

  deleteProduct(int  productId) async {
    await DatabaseHelper.instance.deleteProduct(productId);
    getAllFavProducts();
    notifyListeners();
  }

  getAllFavProducts() async {
    favorites = await DatabaseHelper.instance.getAllProducts();
    notifyListeners();
  }

  updateProduct(Product product){
    product.isFav = !product.isFav!;
    if(product.isFav!){
      !product.isFav!;
      notifyListeners();
      addNewProduct(product);
    }else{
       products.forEach((element) {
        if(product.id == element.id){
          element.isFav = false;
        }
       });
       notifyListeners();
       deleteProduct(product.id!);
    }
  }
}