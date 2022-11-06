import 'dart:convert';
import 'dart:io';

class Config{


  static const uRl="";
  static const uname="";
  static const uPassword="";


  static headers(){
    const credentials='$uname:$uPassword';
    final encodeCredentials=utf8.fuse(base64).encode(credentials);

    Map<String,String> headers={
      HttpHeaders.contentTypeHeader:"application/json",
      HttpHeaders.authorizationHeader:"Basic$encodeCredentials",

    };
    return headers;

  }
}