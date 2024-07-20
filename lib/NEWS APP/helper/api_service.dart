import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiServices{
  Future<String?> apiCalling() async {
    String json = 'https://newsapi.org/v2/everything?q=tesla&from=2024-06-20&sortBy=publishedAt&apiKey=c1808753c3ab46d8b8607c7f6c669360';
    Response response = await http.get(Uri.parse(json));

    if(response.statusCode == 200){
      return response.body;
    }
    else{
      return null;
    }
  }
}