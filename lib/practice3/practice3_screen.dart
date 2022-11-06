import 'package:api_practice/practice3/controller/category_controller.dart';
import 'package:flutter/material.dart';

class Practice3Screen extends StatefulWidget {
  const Practice3Screen({Key? key}) : super(key: key);

  @override
  State<Practice3Screen> createState() => _Practice3ScreenState();
}

class _Practice3ScreenState extends State<Practice3Screen> {

  @override
  void initState() {
    super.initState();
  }

  getCategory()async{
    print('Hi0');
    CategoryController categoryController = CategoryController();
    await categoryController.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    getCategory();
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
    );
  }
}
