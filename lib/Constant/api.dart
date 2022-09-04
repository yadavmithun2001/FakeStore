String baseUrl = "https://fakestoreapi.com";

Uri getUri({required String endPoint}){
  return Uri.parse("${baseUrl}/${endPoint}");
}