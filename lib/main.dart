import 'package:api_first/api_provider.dart';
import 'package:api_first/views/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApiProvider>(
      create: (context) => ApiProvider(),
      child: MaterialApp(
       home: MainPage()
      ),
    );
  }
}

