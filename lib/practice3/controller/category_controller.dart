import 'package:api_practice/network/endpoints.dart';
import 'package:api_practice/network/network_util.dart';

class CategoryController{

  Future getCategory() async {
    try {

      print('Hi1');
      var responseBody = await Network.handleRequest(await Network.getRequest(
        endpoint: EndPoints.categoryUrl,
      ));

      print('Hi2');

      if(responseBody != null){
        print('success');
      }

    } catch (e) {
      print(e);
    }
  }
}