import 'dart:developer';
import 'dart:io';

import 'package:api_first/models/product.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

  DatabaseHelper._();
  static DatabaseHelper instance = DatabaseHelper._();

  late Database database;

  static const productTableName = 'Products';
  static const productIdCol = 'id';
  static const productTitleCol = 'title';
  static const productPriceCol = 'price';
  static const productDescriptionCol = 'description';
  static const productCategoryCol = 'category';
  static const productImageCol = 'image';
  static const productRatingCol = 'rating';
  static const productIsFavCol = 'isFav';


  Future<void> initDatabase()async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/favoriteProduct.db';
    database = await openDatabase(path , version: 1 , onCreate: (db, version) {

      db.execute(''' CREATE TABLE $productTableName ( 
                    $productIdCol INTEGER PRIMARY KEY, $productTitleCol TEXT ,
                    $productPriceCol REAL , $productDescriptionCol TEXT , 
                    $productCategoryCol TEXT , $productImageCol TEXT , 
                    $productRatingCol TEXT 
                ) ''').then((value) => log("recipe"));

    },);
  }

  Future<bool> addNewProduct(Product product)async{
    int rowIndex = await database.insert(productTableName, product.toJson());
    return rowIndex > 0 ? true : false;
  }

  Future<bool> deleteProduct(int  productId) async {
    int deletedRowsCount = await database.delete(productTableName, where: 'id=?', whereArgs: [productId]);
    return deletedRowsCount > 0 ? true : false;
  }

  Future<List<Product>> getAllProducts() async {
    List<Map<String, Object?>> results = await database.query(productTableName);
    List<Product> products = results.map((e) => Product.fromDatabase(e)).toList();
    return products;
  }
  
}