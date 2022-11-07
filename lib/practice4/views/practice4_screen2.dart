




import 'dart:convert';
import 'dart:developer';

import 'package:api_practice/practice4/models/categories.dart';
import 'package:api_practice/practice4/models/product.dart';
import 'package:api_practice/practice4/services/api_service4.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Practice4Screen2 extends StatefulWidget {
  const Practice4Screen2({Key? key}) : super(key: key);

  @override
  State<Practice4Screen2> createState() => _Practice4Screen2State();
}

class _Practice4Screen2State extends State<Practice4Screen2> {

  List<Categories> categoriesList=[];
  List<Product> productList=[];
    bool isLoading=true;


  @override
  void initState() {
    // categoryApi();
    _getData();
    _getProduct();
    super.initState();
  }

  void _getProduct()async{
    productList=(await ApiService4().productApi())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _getData() async {
    categoriesList = (await ApiService4().categoryApi())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Calling API"),

      ),
      body: Container(
        child: Center(
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: categoryApi,
                  child:const Text("Product"),
                ),
                ElevatedButton(
                  onPressed: productApi,
                  child:const Text("Categories api"),
                ),
                ElevatedButton(
                  onPressed: categoryList,
                  child:const Text("Categories List"),
                ),
                Expanded(
                    child: ListView(

                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Category"),
                            Text("Show All")
                          ],
                        ),
                        if (categoriesList.isEmpty)
                          const Center(
                          child: CircularProgressIndicator(),
                        ) else SizedBox(
                          height: MediaQuery.of(context).size.height/5.8,
                          child: ListView.builder(
                            shrinkWrap: true,
                           scrollDirection: Axis.horizontal,
                           itemCount: categoriesList.length,
                              itemBuilder: (context,index){
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            border:const Border(
                                               right:BorderSide(
                                                 color: Colors.black12
                                               ),
                                              left:BorderSide(
                                                  color: Colors.black12
                                              ),
                                              top:BorderSide(
                                                  color: Colors.black12
                                              ),
                                              bottom:BorderSide(
                                                  color: Colors.black12
                                              ),
                                            ),
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  categoriesList[index].image!.src.toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      const SizedBox(height: 10,),
                                      Text(categoriesList[index].name.toString())
                                    ],
                                  ),
                                );
                              }
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Category"),
                            Text("Show All")
                          ],
                        ),
                           const SizedBox(height: 10,),
                           productList.isEmpty?const Center(
                               child: CircularProgressIndicator(),
                            ):
                           SizedBox(
                             height: 210,
                             child: ListView.builder(
                               itemCount: productList.length,
                               shrinkWrap: true,
                               scrollDirection: Axis.horizontal,
                                 itemBuilder: (context,index){

                                   return Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Column(
                                       children: [


                                         Container(
                                           child: Column(
                                             children: [
                                               Image.network(productList[index].images![index].src.toString(),width: 100,height: 100,),
                                               Container(
                                                   height: 50,
                                                   width: 50,
                                                   child: Text(productList[index].name.toString(),maxLines: 3,)),
                                             ],
                                           ),
                                         ),

                                       ],
                                     ),
                                   );


                                 }
                             ),
                           )

                      ],
                    )
                )
              ],

            ),
          )
        ),
      ),
    );
  }





  productApi()async{

           String Username="ck_6d11cf7d09ea4c5dbe11b0c52abcd1c789df4344";
           String Password="cs_96acb214fe51ea3bde37340e6f74fac3fde1b3ec";
           String basicAuth='Basic ${base64.encode(utf8.encode('$Username:$Password'))}';

           print(basicAuth);

           Response response=await get(Uri.parse("https://petvillage.us/wp-json/wc/v3/products"),
           headers: <String, String>{'authorization':basicAuth}
           );
           print("Respons is :$response");

           if(response.statusCode==200){
             print("Status code:${response.statusCode}");
             print("Response Body${response.body}");

           }

  }


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
      var data = jsonDecode(response.body);
      print(data);
      if(response.statusCode==200){

        for (Map i in data) {
          categoriesList.add(Categories.fromJson(i));
        }

        print("Status code:${response.statusCode}");
        print("Response Body${response.body}");

        return categoriesList;
      }else{
        return categoriesList;
      }


    }catch(e){
      log(e.toString());
    }





  }

  categoryList()async{


    String username="ck_6d11cf7d09ea4c5dbe11b0c52abcd1c789df4344";
    String userPass="cs_96acb214fe51ea3bde37340e6f74fac3fde1b3ec";
    
    String basicAuth='Basic ${base64.encode(utf8.encode('$username:$userPass'))}';
    
    print(basicAuth);
    
    
    Response response = await get(Uri.parse("https://petvillage.us/wp-json/wc/v3/products?category=26"),
    headers: <String,String>{'authorization':basicAuth}
    );
    if(response.statusCode==200){
      print("Response StatusCode:${response.statusCode}");
      print("Response Body:${response.body}");


      return jsonDecode(response.body);
    }


  }



}
