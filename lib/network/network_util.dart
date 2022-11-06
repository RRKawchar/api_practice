import 'dart:convert';

import 'package:http/http.dart';

enum RequestStatus{ok, error}

class Network {
  static getRequest({required String endpoint}) async {

    print('Hi3');

    /// Have a question here.
    /// Why not use http?
    String username = "ck_6d11cf7d09ea4c5dbe11b0c52abcd1c789df4344";
    String password = "cs_96acb214fe51ea3bde37340e6f74fac3fde1b3ec";
    String basicAuth =
        'Basic'+ base64.encode(utf8.encode('$username:$password'));

    print(basicAuth);
    Response response = await get(Uri.parse(endpoint), headers: <String, String>{
      'Authorization': basicAuth,
    });

    print("Hi4");

    return response;
  }

  static postRequest({required String endpoint, Map<String, dynamic>? body,Map<String, String>? header}) async {
    Response response = await post(
      Uri.parse(endpoint),
      body: body,
      headers: header,
    );

    return response;
  }

  static updateRequest({required String endpoint}) async {
    Response response = await get(Uri.parse(endpoint));
  }

  static deleteRequest({required String endpoint}) async {
    Response response = await get(Uri.parse(endpoint));
  }

  static handleRequest(Response response){
    try{
      print(response);

      if(response.statusCode >= 200 && response.statusCode <= 210){
        print('SuccessCode: ${response.statusCode}');
        print('SuccessBody: ${response.body}');

        if(response.body.isNotEmpty){
          return jsonDecode(response.body);
        }
        else{
          return response.body;
        }

      }
      if(response.statusCode == 401){
        print('Unauthenticated');
      }
      else{
        print('ErrorCode: ${response.statusCode}');
        print('ErrorBody: ${response.body}');

        print('Something went wrong!');
      }
    }catch(e){
      print(e);
    }
  }
}
