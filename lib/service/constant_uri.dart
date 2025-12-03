abstract class ConstantUri{
  // static String baseUri ="http://localhost:65385";
  static String loginPath = "$baseUri/api/oauth/token";
  static String refreshTokenPath = "$baseUri/api/oauth/refresh";
  static String registerPath = "$baseUri/api/oauth/register";
  static  String baseUri = "https://learn-api.cambofreelance.com";
  static String adminCategoryPath ="$baseUri/api/app/category/list";
  static String adminCreateCategoryPath ="$baseUri/api/app/product/category/create";
  static String adminGetCategoryByIdPath ="$baseUri/api/app/product/category/";
}