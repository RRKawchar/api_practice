import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  List<dynamic> product=[];
  final bool _isloading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Api calling method"),
      ),
      body:Center(
        child: ElevatedButton(
          onPressed: loadProduct,
          child:const Text("get Product"),
        ),
      ),
    );
  }

  void loadProduct()async{

    String username = 'ck_6d11cf7d09ea4c5dbe11b0c52abcd1c789df4344';
    String password = 'ck_6d11cf7d09ea4c5dbe11b0c52abcd1c789df4344';
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    print(basicAuth);

    var response = await http.get(Uri.parse('https://petvillage.us/wp-json/wc/v3/products/categories'),
        headers: <String, String>{'authorization': basicAuth});

    if(response.statusCode==200){

      var jsonData=jsonDecode(response.body);
      print(jsonData);

    }
    print(response.statusCode);
    print(response.body);
  }
}
