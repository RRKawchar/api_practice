import 'dart:convert';

import 'package:api_practice/practice1/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
ApiService apiService=ApiService();
  List<dynamic> _users=[];
  final bool _loading=false;

  @override
  void initState() {
    loadUserList();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(
          child: Text("Api calling"),
        ),
      ),
      body:_users.isNotEmpty?
      ListView.builder(
        itemCount: _users.length,
          itemBuilder: (context,index){

            return Card(
              margin:const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                children: [
                  Image.network(_users[index]['image'],fit: BoxFit.cover,width: 50,height: 50,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_users[index]['firstName']),
                      Text(_users[index]['email']),
                      Text(_users[index]['phone']),
                    ],
                  )
                ],
              ),
            );
          }
      )
      :const Center(
        child: CircularProgressIndicator(),
      )
    );
  }

  void loadUserList()async{

   setState(() {
     _loading==true;
   });
    var response=await http.get(Uri.parse("https://dummyjson.com/users"));


    if(response.statusCode==200){

      var jsonData=jsonDecode(response.body);

      setState(() {
        _users=jsonData['users'];
        _loading==false;
      });
      print(jsonData);
    }
  }
}
