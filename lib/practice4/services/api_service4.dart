import 'dart:convert';
import 'dart:developer';

import 'package:api_practice/practice4/models/product.dart';
import 'package:http/http.dart';

import '../models/categories.dart';

class ApiService4{


  Future<List<Categories>?> categoryApi()async{

    try{
      print("Hi");
      String Username = 'ck_6d11cf7d09ea4c5dbe11b0c52abcd1c789df4344';
      String Password = 'cs_96acb214fe51ea3bde37340e6f74fac3fde1b3ec';
      String basicAuth =
          'Basic ${base64.encode(utf8.encode('$Username:$Password'))}';
      print(basicAuth);

      print("Hello");

      Response response = await get(Uri.parse('https://petvillage.us/wp-json/wc/v3/products/categories'),
          headers: <String, String>{'authorization': basicAuth});
      print("rrrrrrr$response");

      if (response.statusCode == 200) {
        List<Categories> _model =categoriesFromJson(response.body);

        print("Status code Kawchar:${response.statusCode}");
        print("Response Body Kawchar${response.body}");
        return _model;
      }


    }catch(e){
      log(e.toString());
    }





  }
  
  
  Future<List<Product>?> productApi()async{

    try{

      String username="ck_6d11cf7d09ea4c5dbe11b0c52abcd1c789df4344";
      String uPass="cs_96acb214fe51ea3bde37340e6f74fac3fde1b3ec";
      String basicAuth='Basic ${base64.encode(utf8.encode('$username:$uPass'))}';
      print(basicAuth);
      Response response =await get(Uri.parse("https://petvillage.us/wp-json/wc/v3/products"),
          headers: <String,String>{
            'authorization':basicAuth
          }
      );
      print("Response==$response");

      if(response.statusCode==200){
      List<Product> _product=productFromJson(response.body);
        print("Status code Riyaz:${response.statusCode}");
        print("Response Body Riayz${response.body}");

        return _product;
      }
    }catch(e){
      log(e.toString());
    }
    





    return null;
  }
}