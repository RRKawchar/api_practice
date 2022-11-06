class EndPoints{

  ///Auth type api
  static const String _baseUrl = "https://petvillage.us/api";

  static String nonce = "$_baseUrl/get_nonce";
  static String login = "$_baseUrl/user/generate_auth_cookie";
  static String register = "$_baseUrl/user/register";


  ///Product related api

  static const String _dataBaseUrl="https://petvillage.us/wp-json/wc/v3";

  static String productList="$_dataBaseUrl/products";

  ///Dami Data
   static String photoUrl="https://jsonplaceholder.typicode.com/photos";

   static String categoryUrl = "https://petvillage.us/wp-json/wc/v3/products/categories";

}