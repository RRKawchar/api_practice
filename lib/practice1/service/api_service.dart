import 'dart:convert';

import 'package:http/http.dart'as http;
class ApiService{

 static Future loadUserList()async{
    List<dynamic> users=[];

    var response=await http.get(Uri.parse("https://dummyjson.com/users"));


    if(response.statusCode==200){

      var jsonData=jsonDecode(response.body);


        users=jsonData['users'];


      print(jsonData);
    }
  }
}